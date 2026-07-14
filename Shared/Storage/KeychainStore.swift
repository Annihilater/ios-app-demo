import Foundation

/// 凭证存储占位。实现阶段使用 Security framework + Access Group。
public struct KeychainStore: Sendable {
    public init() {}

    public func setSecret(_ value: Data, account: String) throws {
        // TODO
    }

    public func secret(account: String) throws -> Data? {
        // TODO
        nil
    }

    public func deleteSecret(account: String) throws {
        // TODO
    }
}
