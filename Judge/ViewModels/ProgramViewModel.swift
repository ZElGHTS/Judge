import UIKit

final class ProgramViewModel: ObservableObject {

    private(set) var provider: ConnectionProvider
    
    init(connectionProvider: ConnectionProvider) {
        self.provider = connectionProvider
        self.provider.connect()
    }
}
