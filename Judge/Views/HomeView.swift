import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: TrainingManager
    let defaults = UserDefaults.standard
    
    var body: some View {
        if manager.getTrainings().isEmpty {
            MessageEmptyView(title: "Nothing to see here...", message: "You don't have any workout saved! \nGo to the receive tab to save the latest of your workouts.", icon: "moon.zzz")
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(manager.trainings) { training in
                    MessageEmptyView(title: training.time!, message: "You don't have any workout saved! \nGo to the receive tab to save the latest of your workouts.", icon: "moon.zzz")
                }
                Button(action: {
                    manager.trainings = []
                }) {
                    Text("Test")
                }
            }
        }
    }
}
