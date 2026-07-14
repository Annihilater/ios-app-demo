import Foundation
import Observation

@Observable
@MainActor
final class NodeListViewModel {
    var nodes: [String] = []

    func reload() async {
        // TODO: 从 ConfigStore 加载
    }
}
