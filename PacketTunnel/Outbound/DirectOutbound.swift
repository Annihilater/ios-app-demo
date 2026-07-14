import Foundation

/// 直连出站占位，用于验证隧道与分流骨架。
struct DirectOutbound: OutboundAdapter {
    func open(host: String, port: UInt16) async throws -> OutboundStream {
        fatalError("DirectOutbound not implemented yet")
    }
}
