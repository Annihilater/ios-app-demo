import Foundation

/// 单个代理节点。协议细节在后续阶段扩展，避免过早绑定具体实现。
public struct ProxyNode: Identifiable, Codable, Sendable, Hashable {
    public var id: UUID
    public var name: String
    public var server: String
    public var port: UInt16
    public var protocolType: ProxyProtocolType
    public var isEnabled: Bool

    public init(
        id: UUID = UUID(),
        name: String,
        server: String,
        port: UInt16,
        protocolType: ProxyProtocolType = .unspecified,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.name = name
        self.server = server
        self.port = port
        self.protocolType = protocolType
        self.isEnabled = isEnabled
    }
}

public enum ProxyProtocolType: String, Codable, Sendable, Hashable {
    case unspecified
    // 后续按需增加：例如 socks5 / http / 其他出站协议
}
