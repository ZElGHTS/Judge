import SwiftUI
import WatchConnectivity

struct ReceiveView: View {
    let viewModel = ConnectionViewModel(connectionProvider: ConnectionProvider())
    
    var body: some View {
        ReceivedDataView(viewModel: viewModel)
    }
}
