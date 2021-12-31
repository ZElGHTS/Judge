import SwiftUI
import WatchConnectivity

struct ReceiveView: View {
    @EnvironmentObject var manager: TrainingManager
    let viewModel = ConnectionViewModel(connectionProvider: ConnectionProvider())
    
    var body: some View {
        ReceivedDataView(viewModel: viewModel)
            .environmentObject(manager)
    }
}
