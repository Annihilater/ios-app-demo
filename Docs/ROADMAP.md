# 路线图

## Phase 0 — 工程骨架（当前）

- [x] 仓库目录结构
- [x] 架构与目录文档
- [ ] Xcode 双 Target 工程（App + PacketTunnel）
- [ ] App Group / Entitlements 模板落地

## Phase 1 — 最小可连接

- [ ] `Shared` 节点与配置模型 + 编解码
- [ ] App Group 读写配置
- [ ] `VPNManager` 安装/启停 Tunnel
- [ ] `PacketTunnelProvider` 空隧道（仅起 VPN 图标，DIRECT）
- [ ] Home：连接开关 + 状态展示

## Phase 2 — 节点与订阅

- [ ] 手动添加/编辑/删除节点
- [ ] 订阅 URL 拉取与刷新
- [ ] 节点列表 UI 与当前节点选择
- [ ] 基础延迟探测（TCP/HTTP）

## Phase 3 — 规则分流

- [ ] 规则模型与匹配引擎
- [ ] DOMAIN-SUFFIX / IP-CIDR / FINAL
- [ ] 规则列表 UI
- [ ] Tunnel 内应用分流结果

## Phase 4 — 出站协议

- [ ] 出站适配器接口
- [ ] 优先实现 1～2 种常见协议（按需选型）
- [ ] 策略组：手动 / 故障转移

## Phase 5 — 可观测与打磨

- [ ] 流量统计
- [ ] 分流日志
- [ ] 配置导入导出
- [ ] 设置页（DNS、绕过局域网等）
