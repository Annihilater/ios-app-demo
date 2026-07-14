import Foundation

/// 将目标 host/ip 映射到策略：direct / proxy / reject。
struct PacketRouter: Sendable {
    enum Decision: Sendable {
        case direct
        case proxy
        case reject
    }

    func decide(host: String) -> Decision {
        // TODO: 调用 Shared RuleEngine
        .proxy
    }
}
