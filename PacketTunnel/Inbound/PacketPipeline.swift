import Foundation
import NetworkExtension

/// 从 packetFlow 读包 → 路由决策 → 出站 → 回写。
final class PacketPipeline: @unchecked Sendable {
    private let packetFlow: NEPacketTunnelFlow

    init(packetFlow: NEPacketTunnelFlow) {
        self.packetFlow = packetFlow
    }

    func start() {
        // TODO: readPackets 循环
    }

    func stop() {
        // TODO
    }
}
