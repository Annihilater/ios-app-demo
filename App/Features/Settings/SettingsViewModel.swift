import Foundation
import Observation

@Observable
@MainActor
final class SettingsViewModel {
    var bypassLAN = true
}
