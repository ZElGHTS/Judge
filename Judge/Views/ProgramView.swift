import SwiftUI

struct ProgView: View {
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

struct ProgramView: View {
    @ObservedObject var viewModel: ProgramViewModel
    @State var trainingData: [TrainingData] = []
    
    var body: some View {
        VStack {
            Text("Last training Data")
            
            List(trainingData, id: \.self) { data in
                ProgView(training: data)
            }
        }
        .onAppear {
            viewModel.provider.connect()
            viewModel.provider.initFakeData()
            self.trainingData = viewModel.provider.trainingData
        }
    }
}
