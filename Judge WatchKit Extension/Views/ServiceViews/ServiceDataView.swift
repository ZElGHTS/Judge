import SwiftUI

struct ServiceDataView: View {
    @ObservedObject var manager: ServiceManager = ServiceManager()
    
    var body: some View {
        VStack {
            Text("AX : \(self.manager.accelX, specifier: "%.2f")")
            Text("AY : \(self.manager.accelY, specifier: "%.2f")")
            Text("AZ : \(self.manager.accelZ, specifier: "%.2f")")
            Text("GX : \(self.manager.gyroX, specifier: "%.2f")")
            Text("GY : \(self.manager.gyroY, specifier: "%.2f")")
            Text("GZ : \(self.manager.gyroZ, specifier: "%.2f")")
        }
    }
}

struct ServiceDataView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDataView()
    }
}
