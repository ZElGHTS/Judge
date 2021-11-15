import SwiftUI
import WatchConnectivity

struct HomeView: View {
    
    let viewModel = ProgramViewModel(connectionProvider: ConnectionProvider())
    let connect = ConnectionProvider()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home View")
                    .padding()
                NavigationLink(destination: ProgramView(viewModel: viewModel)) {
                    Text("Training Data Receiver")
                }
            }
        }
        .onAppear {
            connect.connect()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
