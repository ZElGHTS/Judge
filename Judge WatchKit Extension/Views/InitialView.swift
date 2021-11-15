import SwiftUI

struct InitialView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @StateObject var activityManager: ActivityManager = ActivityManager()
    
    var body: some View {
        Group {
            if activityManager.serviceActivity {
                ServiceTabNavigation()
            } else if activityManager.trainingActivity {
                TrainingTabNavigation()
            } else {
                ButtonListView()
            }
        }.onAppear {
            activityManager.requestAuthorization()
        }
        .environmentObject(activityManager)
        .environmentObject(workoutManager)
    }
}

@available(watchOSApplicationExtension 8.0, *)
struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
