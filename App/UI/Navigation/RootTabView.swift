import SwiftUI

/// 主 Tab：Home / Nodes / Rules / Logs / Settings
struct RootTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem { Label("Home", systemImage: "shield.lefthalf.filled") }

            NavigationStack {
                NodeListView()
            }
            .tabItem { Label("Nodes", systemImage: "server.rack") }

            NavigationStack {
                RuleListView()
            }
            .tabItem { Label("Rules", systemImage: "list.bullet.rectangle") }

            NavigationStack {
                LogView()
            }
            .tabItem { Label("Logs", systemImage: "doc.text.magnifyingglass") }

            NavigationStack {
                SettingsView()
            }
            .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}
