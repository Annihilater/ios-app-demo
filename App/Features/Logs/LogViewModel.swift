import Foundation
import Observation

@Observable
@MainActor
final class LogViewModel {
    var lines: [String] = []
}
