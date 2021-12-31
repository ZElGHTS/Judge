import SwiftUI

enum Tab {
    case receive, home, settings
}

struct MainNavigationView: View {
    @State private var selection: Tab = .home
    @StateObject var trainingManager: TrainingManager = TrainingManager()
    
    var body: some View {
        TabView(selection: $selection) {
            ReceiveView()
                .tabItem {
                    Label("Receive", systemImage: "square.and.arrow.down")
                        .padding()
                }
                .tag(Tab.receive)
                .environmentObject(trainingManager)
            //try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(UserDefaults.standard.object(forKey: "Trainings") as! Data) as? [TrainingData] ?? [TrainingData]()
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        .padding()
                }
                .tag(Tab.home)
                .environmentObject(trainingManager)
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
