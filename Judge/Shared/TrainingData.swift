import Foundation
import SwiftUI
import WatchConnectivity

class TrainingData: NSObject, ObservableObject, NSSecureCoding, Identifiable {
    static var supportsSecureCoding: Bool = true
    
    let id = UUID()
    @Published var time: String?
    @Published var distance: String?
    @Published var energy: String?
    @Published var heartRate: String?
    
    func initCustom(time: String, distance: String, energy: String, heartRate: String) {
        self.time = time
        self.distance = distance
        self.energy = energy
        self.heartRate = heartRate
    }
    
    required convenience init?(coder: NSCoder) {
        guard let time = coder.decodeObject(forKey: "time") as? String,
              let distance = coder.decodeObject(forKey: "distance") as? String,
              let energy = coder.decodeObject(forKey: "energy") as? String,
              let heartRate = coder.decodeObject(forKey: "heartRate") as? String
        else {
            print("Error while decoding")
            return nil
        }
        
        self.init()
        self.initCustom(time: time, distance: distance, energy: energy, heartRate: heartRate)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.time, forKey: "time")
        coder.encode(self.distance, forKey: "distance")
        coder.encode(self.energy, forKey: "energy")
        coder.encode(self.heartRate, forKey: "heartRate")
    }
}
