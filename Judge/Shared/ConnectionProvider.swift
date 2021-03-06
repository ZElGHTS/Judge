import UIKit
import WatchConnectivity

class ConnectionProvider: NSObject, WCSessionDelegate {
    private let session: WCSession
    
    var trainingData: [TrainingData] = []
    var receivedTrainingData: [TrainingData] = []
    var lastTransfer: CFAbsoluteTime = 0

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        
        #if os(iOS)
            print("Connection Provider initialized on phone")
        #endif
        
        #if os(watchOS)
            print("Connection Provider initialized on watch")
        #endif
        
        self.connect()
    }
    
    func connect() {
        guard WCSession.isSupported() else {
            print("session is not supported")
            return
        }
        
        session.activate()
    }
    
    func send(message: [String: Any]) -> Void {
        session.sendMessage(message, replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    #endif
    
    func initDataTransfer(time: String, distance: String, energy: String, heartRate: String) {
        trainingData.removeAll()
        
        let dataObj = TrainingData()
        dataObj.initCustom(time: time, distance: distance, energy: energy, heartRate: heartRate)
        trainingData.append(dataObj)
        
        NSKeyedArchiver.setClassName("TrainingData", for: TrainingData.self)
        let data = try! NSKeyedArchiver.archivedData(withRootObject: trainingData, requiringSecureCoding: true)
        
        sendPhoneMessage(messageData: data)
    }
    
    func sendPhoneMessage(messageData: Data) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        if lastTransfer + 0.5 > currentTime {
            return
        }
        
        if session.isReachable {
            print("sending phone message")
            let message = ["trainingData": messageData]
            session.sendMessage(message, replyHandler: nil)
        }
        
        lastTransfer = CFAbsoluteTimeGetCurrent()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("entered didReceiveMessage")
        
        if(message["trainingData"] != nil) {
            let loadedMessage = message["trainingData"]
            print("training data no reply handler")
            
            NSKeyedUnarchiver.setClass(TrainingData.self, forClassName: "TrainingData")
            
            let loadedData = try! NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClasses: [TrainingData.self], from: loadedMessage as! Data) as? [TrainingData]
            
            self.receivedTrainingData = loadedData!
            print("data received")
        }
    }
}
