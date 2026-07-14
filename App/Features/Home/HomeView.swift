import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()

    var body: some View {
        // TODO: 连接开关、当前节点、延迟与流量摘要
        ContentUnavailableView(
            "Home",
            systemImage: "shield.lefthalf.filled",
            description: Text("连接总控台 — 待实现")
        )
        .navigationTitle("Home")
    }
}
