import Foundation

/// 基于 App Group 容器的配置读写。实现阶段补原子写（temp + replace）。
public actor ConfigStore {
    private let appGroupID: String
    private let fileName: String

    public init(appGroupID: String, fileName: String = "config.json") {
        self.appGroupID = appGroupID
        self.fileName = fileName
    }

    public func load() throws -> AppConfig {
        guard let url = configURL() else {
            return .empty
        }
        guard FileManager.default.fileExists(atPath: url.path) else {
            return .empty
        }
        let data = try Data(contentsOf: url)
        return try ConfigCodec.decode(data)
    }

    public func save(_ config: AppConfig) throws {
        guard let url = configURL() else {
            throw ConfigStoreError.appGroupUnavailable
        }
        let data = try ConfigCodec.encode(config)
        try data.write(to: url, options: [.atomic])
    }

    private func configURL() -> URL? {
        FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: appGroupID)?
            .appendingPathComponent(fileName)
    }
}

public enum ConfigStoreError: Error, Sendable {
    case appGroupUnavailable
}
