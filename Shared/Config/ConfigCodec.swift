import Foundation

public enum ConfigCodec {
    private static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }()

    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    public static func encode(_ config: AppConfig) throws -> Data {
        try encoder.encode(config)
    }

    public static func decode(_ data: Data) throws -> AppConfig {
        try decoder.decode(AppConfig.self, from: data)
    }
}
