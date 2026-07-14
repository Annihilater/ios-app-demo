import Foundation
import Observation

@Observable
@MainActor
final class HomeViewModel {
    var isConnected = false
    var statusText = "Disconnected"

    func toggleConnection() async {
        // TODO: 调用 VPNManager
    }
}
