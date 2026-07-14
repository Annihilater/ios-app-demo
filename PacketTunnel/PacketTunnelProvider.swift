import NetworkExtension

/// Network Extension 入口。系统在用户连接 VPN 时拉起本进程。
final class PacketTunnelProvider: NEPacketTunnelProvider {
    override func startTunnel(options: [String: NSObject]?, completionHandler: @escaping (Error?) -> Void) {
        // TODO: 加载 App Group 配置 → 建立 tunnel settings → 启动收发包循环
        completionHandler(nil)
    }

    override func stopTunnel(with reason: NEProviderStopReason, completionHandler: @escaping () -> Void) {
        // TODO: 释放出站连接与资源
        completionHandler()
    }

    override func handleAppMessage(_ messageData: Data, completionHandler: ((Data?) -> Void)?) {
        // TODO: 处理主 App 的 reload / query 消息
        completionHandler?(nil)
    }
}
