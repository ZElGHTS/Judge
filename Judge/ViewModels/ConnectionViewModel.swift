import UIKit

// This exist on the iphone side and watch side

final class ConnectionViewModel: ObservableObject {

    private(set) var provider: ConnectionProvider
    
    init(connectionProvider: ConnectionProvider) {
        self.provider = connectionProvider
        self.provider.connect()
    }
}
