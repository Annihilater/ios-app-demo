import Foundation
import Observation

@Observable
@MainActor
final class RuleListViewModel {
    var rules: [String] = []
}
