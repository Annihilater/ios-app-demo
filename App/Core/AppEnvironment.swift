import Foundation

/// 运行环境：App Group ID、Bundle 标识等，后续从 xcconfig / Info 注入。
struct AppEnvironment: Sendable {
    var appGroupID: String
    var tunnelBundleID: String

    static let placeholder = AppEnvironment(
        appGroupID: "group.com.example.proxyclient",
        tunnelBundleID: "com.example.proxyclient.packet-tunnel"
    )
}
