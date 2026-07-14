import SwiftUI

struct RuleListView: View {
    var body: some View {
        ContentUnavailableView(
            "Rules",
            systemImage: "list.bullet.rectangle",
            description: Text("分流规则 — 待实现")
        )
        .navigationTitle("Rules")
    }
}
