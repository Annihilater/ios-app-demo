import Foundation

public struct Subscription: Identifiable, Codable, Sendable, Hashable {
    public var id: UUID
    public var name: String
    public var url: URL
    public var lastUpdatedAt: Date?
    public var isEnabled: Bool

    public init(
        id: UUID = UUID(),
        name: String,
        url: URL,
        lastUpdatedAt: Date? = nil,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.name = name
        self.url = url
        self.lastUpdatedAt = lastUpdatedAt
        self.isEnabled = isEnabled
    }
}
