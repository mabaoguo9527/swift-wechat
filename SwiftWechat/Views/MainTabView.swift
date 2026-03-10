import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            ChatListView()
                .tabItem {
                    Label("微信", systemImage: selectedTab == 0 ? "message.fill" : "message")
                }
                .tag(0)

            ContactsView()
                .tabItem {
                    Label("通讯录", systemImage: selectedTab == 1 ? "person.2.fill" : "person.2")
                }
                .tag(1)

            DiscoverView()
                .tabItem {
                    Label("发现", systemImage: selectedTab == 2 ? "compass.drawing" : "safari")
                }
                .tag(2)

            ProfileView()
                .tabItem {
                    Label("我", systemImage: selectedTab == 3 ? "person.crop.circle.fill" : "person.crop.circle")
                }
                .tag(3)
        }
        .accentColor(.green)
    }
}

#Preview {
    MainTabView()
}
