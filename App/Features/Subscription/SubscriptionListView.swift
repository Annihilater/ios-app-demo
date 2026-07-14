import SwiftUI

struct SubscriptionListView: View {
    var body: some View {
        ContentUnavailableView(
            "Subscriptions",
            systemImage: "link",
            description: Text("订阅管理 — 待实现")
        )
        .navigationTitle("Subscriptions")
    }
}
