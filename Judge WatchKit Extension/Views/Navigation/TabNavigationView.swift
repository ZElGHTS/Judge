import SwiftUI
import WatchKit

enum Tab {
    case controls, data, nowPlaying
}

struct ServiceTabNavigation: View {
    @EnvironmentObject var activityManager: ActivityManager
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .data
    
    var body: some View {
        TabView(selection: $selection) {
            ServiceMainView()
                .environmentObject(activityManager)
                .environmentObject(workoutManager)
                .tag(Tab.controls)
            ServiceDataView()
                .tag(Tab.data)
            NowPlayingView()
                .tag(Tab.nowPlaying)
        }
        .navigationTitle("Services")
        .navigationBarHidden(selection == .nowPlaying)
        .onChange(of: workoutManager.running) { _ in
            displayDataView()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .onChange(of: isLuminanceReduced) { _ in
            displayDataView()
        }
    }
    
    private func displayDataView() {
        withAnimation {
            selection = .data
        }
    }
}

struct TrainingTabNavigation: View {
    @EnvironmentObject var activityManager: ActivityManager
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .data
    @State private var executed: Bool = false
    
    var body: some View {
        TabView(selection: $selection) {
            TrainingMainView()
                .environmentObject(activityManager)
                .environmentObject(workoutManager)
                .tag(Tab.controls)
            TrainingDataView()
                .environmentObject(workoutManager)
                .tag(Tab.data)
                .onAppear { start() }
            NowPlayingView()
                .tag(Tab.nowPlaying)
            
        }
        .navigationTitle("Training")
        .navigationBarHidden(selection == .nowPlaying)
        .onChange(of: workoutManager.running) { _ in
            displayDataView()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .onChange(of: isLuminanceReduced) { _ in
            displayDataView()
        }
    }
    
    private func start() {
        if !executed {
            workoutManager.start = true
            executed = true
        }
    }
    
    private func displayDataView() {
        withAnimation {
            selection = .data
        }
    }
}
