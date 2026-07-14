import Foundation
import Observation

@Observable
@MainActor
final class SubscriptionViewModel {
    var sources: [String] = []

    func refreshAll() async {
        // TODO: SubscriptionFetcher
    }
}
