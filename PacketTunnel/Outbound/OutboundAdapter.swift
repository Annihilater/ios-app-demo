import Foundation

/// 出站协议统一接口。具体协议实现后续按需添加。
protocol OutboundAdapter: Sendable {
    func open(host: String, port: UInt16) async throws -> OutboundStream
}

protocol OutboundStream: Sendable {
    func write(_ data: Data) async throws
    func read() async throws -> Data
    func close() async
}
