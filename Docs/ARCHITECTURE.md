# 架构说明

## 1. 目标产品能力（对标 Quantumult X 的子集）

按优先级分阶段交付，避免一次做完整 QX：

| 阶段 | 能力 | 对应模块 |
|------|------|----------|
| P0 | 手动添加节点、一键连接/断开 | `App/Features/Home`, `App/Features/Nodes`, `PacketTunnel` |
| P0 | 基础配置持久化与 App Group 同步 | `Shared/Config`, `Shared/Storage` |
| P1 | 订阅拉取与节点列表刷新 | `App/Features/Subscription`, `Shared/Subscription` |
| P1 | 规则分流（DIRECT / PROXY / REJECT） | `Shared/Rules`, `PacketTunnel/Routing` |
| P2 | 策略组（自动测速/故障转移） | `Shared/Policy`, `PacketTunnel/Outbound` |
| P2 | 流量统计、连接日志 | `App/Features/Logs`, `Shared/Logging` |
| P3 | 脚本/重写/MitM 等高级能力 | 暂不进骨架，避免过早设计 |

## 2. 进程模型

iOS 代理类 App 必须拆成两个进程：

1. **主 App**：SwiftUI 控制面。不能在主进程里长期跑隧道。
2. **Packet Tunnel Extension**：系统拉起的 Network Extension，负责 `NEPacketTunnelProvider` 收发包。

两者 **不能直接共享内存**，只能通过：

- App Group 容器（配置文件、数据库、共享 UserDefaults）
- `NETunnelProviderSession` 发 message（轻量 IPC）
- 通知 / 文件变更（状态刷新）

## 3. 模块边界

### App/

- 只做 UI、用户交互、调用系统 VPN API
- 不实现具体代理协议握手细节（可放 Shared 或后续 SPM）
- Feature 按页面/用例切分，避免巨型 `ContentView`

### PacketTunnel/

- 入口：`PacketTunnelProvider`
- 子目录：
  - `Tunnel/`：隧道生命周期、settings、DNS
  - `Routing/`：规则匹配结果 → 出站选择
  - `Outbound/`：各协议出站适配器接口
  - `Inbound/`：来自 utun 的包处理管线

### Shared/

- 纯逻辑、可单测
- 禁止依赖 UIKit/SwiftUI（便于 Extension 链接）
- 模型、编解码、规则 AST、配置 schema 版本管理

## 4. 配置数据流

```text
用户编辑/导入
    → App 写入 App Group（versioned config）
    → 发送 reload message 给 Extension（若已连接）
    → Extension 热加载或重连应用
```

配置建议使用 **显式版本号**（`configVersion`），避免 App/Extension 读写竞态时解析到半写入文件。

## 5. 目录约定

| 路径 | 职责 |
|------|------|
| `*/Features/*` | 面向用户功能（UI + 轻量 ViewModel） |
| `*/Core/*` | 跨 Feature 的基础设施（DI、环境、路由壳） |
| `*/Services/*` | 对系统/网络的门面（VPNManager、订阅下载器） |
| `Shared/Models` | 领域模型 |
| `Shared/Protocols` | 抽象接口，便于测试替换 |

## 6. 测试策略

- `Shared`：单元测试优先（规则匹配、订阅解析、配置迁移）
- `App`：ViewModel 测试 + 少量 UI 测试
- `PacketTunnel`：协议/路由逻辑尽量下沉 Shared 后测；隧道集成测依赖真机

## 7. 安全注意

- 节点凭证只存 App Group 或 Keychain（共享 Keychain Access Group）
- 日志默认脱敏（host 可留，token/password 禁止落盘明文过久）
- 不在客户端硬编码任何第三方机场/服务商密钥
