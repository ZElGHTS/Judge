import Foundation
import SwiftUI
import HealthKit
import WatchKit

struct SummaryView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.dismiss) var dismiss
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var body: some View {
        if workoutManager.workout == nil {
            ProgressView("Saving Workout")
                .navigationBarHidden(true)
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    SummaryDataView(title: "Total Time", value: getTotalTime())
                        .foregroundStyle(.yellow)
                    SummaryDataView(title: "Total Distance", value: getTotalDistance())
                        .foregroundStyle(.green)
                    SummaryDataView(title: "Total Energy", value: getTotalEnergy())
                        .foregroundColor(.pink)
                    SummaryDataView(title: "Avg. Heart Rate", value: getAverageHR())
                        .foregroundColor(.red)
                    Text("Activity Rings")
                    ActivityRingsView(healthStore: workoutManager.healthStore)
                        .frame(width: 50, height: 50)
                    HStack {
                        Button("Share") {
                            //@ObservedObject var test = TrainingDataModel()
                            dismiss()
                        }
                        Button("Done") {
                            dismiss()
                        }
                    }
                }
                .scenePadding()
            }
            .navigationTitle("Summary")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func getTotalTime() -> String {
        return durationFormatter.string(from: workoutManager.workout?.duration ?? 0.0) ?? ""
    }
    
    private func getTotalDistance() -> String {
        return Measurement(value: workoutManager.workout?.totalDistance?.doubleValue(for: .meter()) ?? 0.0, unit: UnitLength.meters)
                    .formatted(.measurement(width: .abbreviated, usage: .road, numberFormatStyle: .number.precision(.fractionLength(2))))
    }
    
    private func getTotalEnergy() -> String {
        return Measurement(value: workoutManager.workout?.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0.0, unit: UnitEnergy.kilocalories)
                    .formatted(.measurement(width: .abbreviated, usage: .workout, numberFormatStyle: .number.precision(.fractionLength(0))))
    }
    
    private func getAverageHR() -> String {
        return workoutManager.averageHeartRate.formatted(.number.precision(.fractionLength(0))) + " bpm"
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}

struct SummaryDataView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
            .foregroundStyle(.foreground)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
        Divider()
    }
}
