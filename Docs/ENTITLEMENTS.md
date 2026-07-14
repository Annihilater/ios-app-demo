# 权限与能力（Entitlements）

实现阶段需要在 Apple Developer 后台与 Xcode 中配置，**当前仅文档与示例文件**。

## 必需 Capability

| Capability | 主 App | PacketTunnel | 用途 |
|------------|--------|--------------|------|
| Personal VPN | ✓ | | 管理系统 VPN 配置 |
| Network Extensions → Packet Tunnel | ✓ | ✓ | 自定义隧道 |
| App Groups | ✓ | ✓ | 共享配置/状态 |
| Keychain Sharing（可选） | ✓ | ✓ | 共享敏感凭证 |

## App Group 建议标识

```text
group.$(TEAM_ID).proxyclient
```

示例见 `Configs/AppGroup.example.plist`。真实 Team ID 用本地 `Configs/Local.xcconfig`（已 gitignore）注入。

## Info.plist 要点

### 主 App

- 用途说明字符串（若访问本地网络、相册导入配置等）
- 后台模式按需添加（一般 VPN 客户端主 App 不需要常驻后台）

### PacketTunnel

- `NSExtension` → `NEPacketTunnelProvider`
- `NSExtensionPrincipalClass` 指向 Provider

## App Store 注意

- VPN 类应用需清晰隐私政策：收集哪些网络数据、是否上传
- 不得在审核材料中引导违法用途
- 企业分发与个人开发者账号能力范围不同，提前确认
