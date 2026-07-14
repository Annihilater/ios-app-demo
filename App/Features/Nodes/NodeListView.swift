import SwiftUI

struct NodeListView: View {
    var body: some View {
        ContentUnavailableView(
            "Nodes",
            systemImage: "server.rack",
            description: Text("节点列表 — 待实现")
        )
        .navigationTitle("Nodes")
    }
}
