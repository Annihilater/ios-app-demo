import Foundation

/// 拉取订阅源并解析为节点列表（解析逻辑下沉 Shared）。
actor SubscriptionFetcher {
    func fetch(url: URL) async throws -> Data {
        // TODO: URLSession + 超时/重试策略
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
