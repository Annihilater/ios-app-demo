import Foundation

public protocol ConfigProviding: Sendable {
    func loadConfig() async throws -> AppConfig
    func saveConfig(_ config: AppConfig) async throws
}
