import SwiftUI

struct dataInfo: View {
    var training: TrainingData
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(UIColor.lightGray))
                .frame(width: 300, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
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
}

struct ReceivedDataView: View {
    @ObservedObject var viewModel: ConnectionViewModel
    @State var trainingData: [TrainingData] = []
    
    var body: some View {
        VStack {
            if trainingData.isEmpty {
                MessageEmptyView(title: "No data received", message: "There is currently no data available. \nGo to the watch version of Judge and share your workout to see it here. \n\n* Make sure that Judge is CLOSED on your iPhone before sharing from your watch.", icon: "exclamationmark.octagon")
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(UIColor.lightGray))
                    .frame(width: 300, height: 300)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            } else {
                Text("Last data received")
                    .font(.system(size: 25, weight: .bold))
                    .padding()
                
                dataInfo(training: trainingData[0])
            }
        }
        .onAppear {
            viewModel.provider.connect()
            self.trainingData = viewModel.provider.receivedTrainingData
        }
    }
}
