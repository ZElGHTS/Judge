import Foundation
import UIKit
import CoreMotion

class ServiceManager : ObservableObject {
    
    @Published var accelX: Double
    @Published var accelY: Double
    @Published var accelZ: Double
    @Published var gyroX: Double
    @Published var gyroY: Double
    @Published var gyroZ: Double
    
    let manager = CMMotionManager()
    
    init() {
        accelX = 0.00
        accelY = 0.00
        accelZ = 0.00
        gyroX = 0.00
        gyroY = 0.00
        gyroZ = 0.00
        startAccelerometers()
        startGyros()
    }
    
    
    private func startAccelerometers() {
        var timer = Timer()
        if self.manager.isAccelerometerAvailable {
           self.manager.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
           self.manager.startAccelerometerUpdates()

           timer = Timer(fire: Date(), interval: (1.0/60.0), repeats: true, block: { [self] (timer) in
              if let accelData = self.manager.accelerometerData {
                  self.accelX = accelData.acceleration.x
                  self.accelY = accelData.acceleration.y
                  self.accelZ = accelData.acceleration.z
              }
           })

            RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
       }
    }
    
    private func startGyros() {
        var timer = Timer()
        if manager.isGyroAvailable {
           self.manager.gyroUpdateInterval = 1.0 / 60.0
           self.manager.startGyroUpdates()

           // Configure a timer to fetch the accelerometer data.
           timer = Timer(fire: Date(), interval: (1.0/60.0),
                         repeats: true, block: { [self] (timer) in
              // Get the gyro data.
              if let data = self.manager.gyroData {
                 gyroX = data.rotationRate.x
                 gyroY = data.rotationRate.y
                 gyroZ = data.rotationRate.z

                 // Use the gyroscope data in your app.
              }
           })

           // Add the timer to the current run loop.
            RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
        }
     }
}
