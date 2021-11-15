import SwiftUI

struct TrainingMainView: View {
    @EnvironmentObject var activityManager: ActivityManager
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        HStack {
            VStack {
                Button {
                    workoutManager.endWorkout()
                    activityManager.trainingActivity.toggle()
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(.red)
                .font(.title2)
                Text("End")
            }
            VStack {
                Button {
                    workoutManager.togglePause()
                } label: {
                    Image(systemName: workoutManager.running ? "pause" : "play")
                }
                .tint(.yellow)
                .font(.title2)
                Text(workoutManager.running ? "Pause" : "Resume")
            }
        }
    }
}

struct TrainingMainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingMainView()
    }
}
