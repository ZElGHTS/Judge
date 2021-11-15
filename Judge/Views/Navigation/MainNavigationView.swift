import SwiftUI

struct MainNavigationView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        .padding()
                }
            RecordsView()
                .tabItem {
                    Label("Records", systemImage: "square.stack")
                        .padding()
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                        .padding()
                }
        }
        .font(.headline)
    }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
