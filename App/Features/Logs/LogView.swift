import SwiftUI

struct LogView: View {
    var body: some View {
        ContentUnavailableView(
            "Logs",
            systemImage: "doc.text.magnifyingglass",
            description: Text("连接与分流日志 — 待实现")
        )
        .navigationTitle("Logs")
    }
}
