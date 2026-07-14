import Foundation

/// 主 App ↔ Extension 消息约定（序列化格式后续定）。
public enum TunnelMessage: Codable, Sendable {
    case reloadConfig
    case queryStatus
}

public struct TunnelStatusSnapshot: Codable, Sendable {
    public var isConnected: Bool
    public var selectedNodeName: String?
    public var uplinkBytes: UInt64
    public var downlinkBytes: UInt64

    public init(
        isConnected: Bool,
        selectedNodeName: String? = nil,
        uplinkBytes: UInt64 = 0,
        downlinkBytes: UInt64 = 0
    ) {
        self.isConnected = isConnected
        self.selectedNodeName = selectedNodeName
        self.uplinkBytes = uplinkBytes
        self.downlinkBytes = downlinkBytes
    }
}
