import Foundation

class TrainingManager: ObservableObject {
    @Published var trainings: [TrainingData] = []
    
    init() {
        self.trainings = getTrainings()
    }
    
    func save(training: TrainingData) {
        trainings = getTrainings()
        trainings.append(training)
        let data = try! NSKeyedArchiver.archivedData(withRootObject: trainings, requiringSecureCoding: true)
        UserDefaults.standard.set(data, forKey: "Trainings")
        UserDefaults.standard.synchronize()
    }
    
    func getTrainings() -> [TrainingData] {
        let shitToReturn: [TrainingData] = []
        if UserDefaults.standard.array(forKey: "Trainings") == nil {
            return shitToReturn
        } else {
            return UserDefaults.standard.array(forKey: "Trainings") as! [TrainingData]
        }
    }
}
