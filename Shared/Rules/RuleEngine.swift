import Foundation

/// 按顺序匹配规则列表，无命中则使用 `.final` 或默认 proxy。
public struct RuleEngine: Sendable {
    private let rules: [ProxyRule]
    private let matcher: RuleMatcher

    public init(rules: [ProxyRule], matcher: RuleMatcher = RuleMatcher()) {
        self.rules = rules.filter(\.isEnabled)
        self.matcher = matcher
    }

    public func policy(for host: String) -> RulePolicy {
        for rule in rules {
            if matcher.matches(rule: rule, host: host) {
                return rule.policy
            }
        }
        return .proxy
    }
}
