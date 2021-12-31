import SwiftUI

struct dataInfo: View {
    @EnvironmentObject var manager: TrainingManager
    var training: TrainingData
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Last data received")
                .font(.system(size: 25, weight: .bold))
                .padding()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.init("DataCardHolder"))
                    .frame(width: 300, height: 400)
                    .shadow(color: Color.init("Shadow"), radius: 10, x: 10, y: 10)
                    .padding()
                VStack {
                    dataRow(image: "clock", data: "Time : \(training.time!)", color: .yellow, offsetImage: -21, offsetText: 2)
                    dataRow(image: "hare", data: "Distance : \(training.distance!)", color: .green, offsetImage: -15, offsetText: 0)
                    dataRow(image: "flame.fill", data: "Energy : \(training.energy!)", color: .pink, offsetImage: -25, offsetText: 4)
                    dataRow(image: "heart", data: "Avg. HR : \(training.heartRate!)", color: .red, offsetImage: -14.5, offsetText: 9)
                }
            }
            
            Button(action: {
                manager.save(training: training)
                /*let defaults = UserDefaults.standard
                var trainings: [TrainingData]? = []
                trainings = defaults.object(forKey: "Trainings") as? [TrainingData]
                trainings?.append(training)
                defaults.set(trainings, forKey: "Trainings")*/
            }) {
                Text("Save")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .scenePadding()
            }
            .background(Color.init("AccentColor"))
            .cornerRadius(15.0)
            .offset(x: 0, y: 30)
        }
    }
}

struct dataRow: View {
    let image: String
    let data: String
    let color: Color
    let offsetImage: CGFloat
    let offsetText: Int
    
    var body: some View {
        return HStack {
                    Image(systemName: image)
                        .font(.system(size: 50))
                        .foregroundColor(color)
                        .offset(x: offsetImage)
                    
                    Text(data)
                        .font(.headline)
                        .foregroundColor(color)
                        .offset(x: 9)
                }.scenePadding()
    }
}

struct ReceivedDataView: View {
    @ObservedObject var viewModel: ConnectionViewModel
    @EnvironmentObject var manager: TrainingManager
    @State var trainingData: [TrainingData] = []
    
    var body: some View {
        VStack(alignment: .center) {
            if trainingData.isEmpty {
                MessageEmptyView(title: "No data received", message: "There is currently no data available. \nGo to the watch version of Judge and share your workout to see it here. \n\n* Make sure that Judge is CLOSED on your iPhone before sharing from your watch.", icon: "exclamationmark.octagon")
            } else {
                dataInfo(training: trainingData[0])
                    .environmentObject(manager)
            }
        }
        .onAppear {
            viewModel.provider.connect()
            self.trainingData = viewModel.provider.receivedTrainingData
        }
    }
}
