import Foundation
import SwiftUI

class TrainingModel {
    @ObservedObject var viewModel: ConnectionViewModel
    
    var time: String
    var distance: String
    var energy: String
    var heartRate: String
    
    init(viewModel: ConnectionViewModel, time: String, distance: String, energy: String, heartRate: String) {
        self.viewModel = viewModel
        self.time = time
        self.distance = distance
        self.energy = energy
        self.heartRate = heartRate
    }
    
    func sendData() {
        viewModel.provider.connect()
        viewModel.provider.initDataTransfer(time: self.time, distance: self.distance, energy: self.energy, heartRate: self.heartRate)
    }
}
