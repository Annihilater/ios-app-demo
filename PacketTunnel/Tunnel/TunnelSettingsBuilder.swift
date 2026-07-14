import Foundation
import NetworkExtension

/// 根据配置生成 NEPacketTunnelNetworkSettings（远程地址、DNS、路由表）。
enum TunnelSettingsBuilder {
    static func build() throws -> NEPacketTunnelNetworkSettings {
        // TODO: 真实远端地址与 DNS
        NEPacketTunnelNetworkSettings(tunnelRemoteAddress: "127.0.0.1")
    }
}
