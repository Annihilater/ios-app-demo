import Foundation
import NetworkExtension

/// 封装 NETunnelProviderManager：安装配置、连接、断开、状态观察。
@MainActor
final class VPNManager {
    private(set) var status: NEVPNStatus = .invalid

    func prepare() async throws {
        // TODO: loadAllFromPreferences + ensure manager exists
    }

    func connect() async throws {
        // TODO: startVPNTunnel
    }

    func disconnect() async throws {
        // TODO: stopVPNTunnel
    }
}
