import Foundation

/// 策略组占位：手动选择 / 故障转移等，Phase 4 再落地。
public struct PolicyGroup: Identifiable, Codable, Sendable, Hashable {
    public enum Mode: String, Codable, Sendable, Hashable {
        case select
        case urlTest
        case fallback
    }

    public var id: UUID
    public var name: String
    public var mode: Mode
    public var nodeIDs: [UUID]

    public init(
        id: UUID = UUID(),
        name: String,
        mode: Mode = .select,
        nodeIDs: [UUID] = []
    ) {
        self.id = id
        self.name = name
        self.mode = mode
        self.nodeIDs = nodeIDs
    }
}
