import SwiftUI
import WatchConnectivity

struct HomeView: View {
    
    let viewModel = ConnectionViewModel(connectionProvider: ConnectionProvider())
    //let provider = ConnectionProvider()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home View")
                    .padding()
                NavigationLink(destination: ReceivedDataView(viewModel: viewModel)) {
                    Text("Training Data Receiver")
                }
            }
        }
        /*.onAppear {
            provider.connect()
        }*/
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
