# ProxyClient（ios-app-demo）

基于 **Swift + SwiftUI** 的 iOS 网络代理客户端脚手架，功能定位参考 Quantumult X：

- 节点管理与订阅
- 规则分流（DOMAIN / IP / GEOIP 等）
- Packet Tunnel 代理（Network Extension）
- 连接状态、流量与日志
- 配置导入导出

> **合规说明**：本仓库仅提供客户端架构与工程结构。使用代理/VPN 须遵守当地法律法规与 Apple 开发者协议。上架 App Store 需要 `Network Extension` 权限、隐私说明与合规审核材料。

## 技术选型

| 层级 | 技术 |
|------|------|
| 语言 | Swift 5.9+ / 目标 Swift 6 |
| UI | SwiftUI（局部 UIKit 仅在必要时） |
| 隧道 | Network Extension · Packet Tunnel Provider |
| 并发 | Swift Concurrency（async/await、actor） |
| 状态 | `@Observable` |
| 共享数据 | App Group + 共享 Swift 模块 |
| 持久化 | SwiftData / 文件配置（JSON/TOML 风格配置） |

## 仓库结构

```text
ios-app-demo/
├── README.md
├── Docs/                          # 设计与开发文档
├── Configs/                       # Xcode / SwiftLint / 环境配置模板
├── App/                           # 主 App Target（UI + 业务编排）
├── PacketTunnel/                  # Network Extension Target（数据面）
├── Shared/                        # App 与 Extension 共用代码
└── Scripts/                       # 本地脚本（生成、检查等）
```

更细的目录说明见 [Docs/ARCHITECTURE.md](Docs/ARCHITECTURE.md)。

## Targets 关系

```text
┌─────────────────────┐
│   App (SwiftUI)     │  控制面：节点/规则/设置 UI
│                     │  调用 NEVPNManager 启停隧道
└──────────┬──────────┘
           │ App Group + XPC/文件 IPC
┌──────────▼──────────┐
│  PacketTunnel       │  数据面：收包、分流、出站代理
│  (NEPacketTunnel)   │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│  Shared             │  模型、配置解析、规则引擎接口、日志协议
└─────────────────────┘
```

## 前置条件（后续实现时）

1. Apple Developer Program 账号
2. 开通 **Network Extensions** / **Personal VPN** 相关 capability
3. 配置 **App Groups**（主 App 与 Extension 共享配置）
4. 真机调试（模拟器对 Packet Tunnel 支持有限）

## 当前阶段

- [x] 仓库目录结构
- [ ] Xcode 工程与 Target 绑定
- [ ] Shared 配置/节点模型
- [ ] Packet Tunnel 最小可运行隧道
- [ ] 主 App 连接开关与节点列表 UI

## License

见 [LICENSE](LICENSE)。
