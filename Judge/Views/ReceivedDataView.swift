import SwiftUI

struct dataInfo: View {
    var training: TrainingData
    
    var body: some View {
        VStack {
            Text("\(training.time!)")
                .font(.headline)
                .foregroundColor(.yellow)
            Text("\(training.distance!)")
                .font(.headline)
                .foregroundColor(.green)
            Text("\(training.energy!)")
                .font(.headline)
                .foregroundColor(.pink)
            Text("\(training.heartRate!)")
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

struct ReceivedDataView: View {
    @ObservedObject var viewModel: ConnectionViewModel
    @State var trainingData: [TrainingData] = []
    
    var body: some View {
        VStack {
            Text("Last training Data")
            
            List(trainingData, id: \.self) { data in
                dataInfo(training: data)
            }
        }
        .onAppear {
            viewModel.provider.connect()
            self.trainingData = viewModel.provider.receivedTrainingData
        }
    }
}
