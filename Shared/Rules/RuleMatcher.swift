import Foundation

public struct RuleMatcher: Sendable {
    public init() {}

    public func matches(rule: ProxyRule, host: String) -> Bool {
        let host = host.lowercased()
        switch rule.type {
        case .domain:
            return host == rule.value.lowercased()
        case .domainSuffix:
            let suffix = rule.value.lowercased()
            return host == suffix || host.hasSuffix("." + suffix)
        case .domainKeyword:
            return host.contains(rule.value.lowercased())
        case .ipCIDR:
            // TODO: 实现 IP/CIDR 匹配
            return false
        case .final:
            return true
        }
    }
}
