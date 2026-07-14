import Foundation

public struct ProxyRule: Identifiable, Codable, Sendable, Hashable {
    public var id: UUID
    public var type: RuleType
    public var value: String
    public var policy: RulePolicy
    public var isEnabled: Bool

    public init(
        id: UUID = UUID(),
        type: RuleType,
        value: String,
        policy: RulePolicy,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.type = type
        self.value = value
        self.policy = policy
        self.isEnabled = isEnabled
    }
}

public enum RuleType: String, Codable, Sendable, Hashable {
    case domain
    case domainSuffix
    case domainKeyword
    case ipCIDR
    case final
}

public enum RulePolicy: String, Codable, Sendable, Hashable {
    case direct
    case proxy
    case reject
}
