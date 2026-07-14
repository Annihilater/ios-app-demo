import Foundation

/// 整份客户端配置的聚合根。写入 App Group 时带版本号。
public struct AppConfig: Codable, Sendable, Hashable {
    public var version: Int
    public var selectedNodeID: UUID?
    public var nodes: [ProxyNode]
    public var rules: [ProxyRule]
    public var subscriptions: [Subscription]
    public var bypassLAN: Bool

    public init(
        version: Int = ConfigVersion.current,
        selectedNodeID: UUID? = nil,
        nodes: [ProxyNode] = [],
        rules: [ProxyRule] = [],
        subscriptions: [Subscription] = [],
        bypassLAN: Bool = true
    ) {
        self.version = version
        self.selectedNodeID = selectedNodeID
        self.nodes = nodes
        self.rules = rules
        self.subscriptions = subscriptions
        self.bypassLAN = bypassLAN
    }

    public static let empty = AppConfig()
}
