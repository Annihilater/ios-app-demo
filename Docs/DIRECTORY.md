# 目录树（权威说明）

本文档描述本仓库**目标目录结构**。Xcode 工程文件可在下一步用 XcodeGen / Tuist / 手建工程挂载这些路径。

```text
ios-app-demo/
├── README.md
├── LICENSE
├── .gitignore
│
├── Docs/
│   ├── ARCHITECTURE.md          # 进程模型、模块边界、阶段规划
│   ├── DIRECTORY.md             # 本文件
│   ├── ROADMAP.md               # 功能路线图
│   └── ENTITLEMENTS.md          # 权限与 App Group 说明
│
├── Configs/
│   ├── Shared.xcconfig          # 公共编译配置模板
│   ├── Debug.xcconfig
│   ├── Release.xcconfig
│   └── AppGroup.example.plist   # App Group 标识示例（勿提交真实团队 ID 密钥）
│
├── Scripts/
│   ├── bootstrap.sh             # 本地环境检查
│   └── tree.sh                  # 打印目录树
│
├── App/                         # Target: ProxyClient
│   ├── ProxyClientApp.swift     # @main 入口
│   ├── Info.plist
│   ├── ProxyClient.entitlements
│   │
│   ├── Core/
│   │   ├── AppEnvironment.swift
│   │   └── DependencyContainer.swift
│   │
│   ├── Features/
│   │   ├── Home/                # 总开关、当前节点、延迟
│   │   │   ├── HomeView.swift
│   │   │   └── HomeViewModel.swift
│   │   ├── Nodes/               # 节点列表、编辑、测速
│   │   │   ├── NodeListView.swift
│   │   │   ├── NodeEditView.swift
│   │   │   └── NodeListViewModel.swift
│   │   ├── Rules/               # 规则列表与编辑
│   │   │   ├── RuleListView.swift
│   │   │   └── RuleListViewModel.swift
│   │   ├── Subscription/        # 订阅源管理
│   │   │   ├── SubscriptionListView.swift
│   │   │   └── SubscriptionViewModel.swift
│   │   ├── Logs/                # 连接/分流日志
│   │   │   ├── LogView.swift
│   │   │   └── LogViewModel.swift
│   │   └── Settings/            # 通用设置、DNS、关于
│   │       ├── SettingsView.swift
│   │       └── SettingsViewModel.swift
│   │
│   ├── Services/
│   │   ├── VPNManager.swift     # NEVPNManager / NETunnelProviderManager 封装
│   │   ├── ConfigSyncService.swift
│   │   └── SubscriptionFetcher.swift
│   │
│   ├── UI/
│   │   ├── Components/          # 可复用组件
│   │   ├── Theme/               # 颜色、间距、字体
│   │   └── Navigation/          # Tab / Stack 路由
│   │
│   └── Resources/
│       ├── Assets.xcassets/
│       └── Localizable.xcstrings
│
├── PacketTunnel/                # Target: PacketTunnel (Network Extension)
│   ├── PacketTunnelProvider.swift
│   ├── Info.plist
│   ├── PacketTunnel.entitlements
│   │
│   ├── Tunnel/
│   │   ├── TunnelLifecycle.swift
│   │   └── TunnelSettingsBuilder.swift
│   ├── Routing/
│   │   └── PacketRouter.swift
│   ├── Outbound/
│   │   ├── OutboundAdapter.swift
│   │   └── DirectOutbound.swift
│   └── Inbound/
│       └── PacketPipeline.swift
│
└── Shared/                      # 编译进 App + PacketTunnel 的共享源码
    ├── SharedAnchor.swift       # 模块锚点（便于后续 SPM 化）
    ├── Models/
    │   ├── ProxyNode.swift
    │   ├── ProxyRule.swift
    │   ├── Subscription.swift
    │   └── AppConfig.swift
    ├── Config/
    │   ├── ConfigStore.swift
    │   ├── ConfigCodec.swift
    │   └── ConfigVersion.swift
    ├── Rules/
    │   ├── RuleEngine.swift
    │   └── RuleMatcher.swift
    ├── Policy/
    │   └── PolicyGroup.swift
    ├── Storage/
    │   ├── AppGroup.swift
    │   └── KeychainStore.swift
    ├── Logging/
    │   └── Logger.swift
    └── Protocols/
        ├── ConfigProviding.swift
        └── TunnelMessaging.swift
```

## 命名约定

- **文件**：类型同名，`PascalCase.swift`
- **Feature 目录**：按用户可见功能命名，不按技术层堆砌
- **Shared 禁止**：`import SwiftUI` / `import UIKit`（保持 Extension 可链）
- **后续 SPM**：稳定后可将 `Shared/` 抽为 `ProxyClientKit` local package
