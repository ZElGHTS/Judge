import SwiftUI

enum Tab {
    case receive, home, settings
}

struct MainNavigationView: View {
    @State private var selection: Tab = .home
    
    var body: some View {
        TabView(selection: $selection) {
            ReceiveView()
                .tabItem {
                    Label("Receive", systemImage: "square.and.arrow.down")
                        .padding()
                }
                .tag(Tab.receive)
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        .padding()
                }
                .tag(Tab.home)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                        .padding()
                }
                .tag(Tab.settings)
        }
        .font(.headline)
    }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
