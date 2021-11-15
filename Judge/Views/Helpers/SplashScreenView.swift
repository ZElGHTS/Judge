import SwiftUI

struct SplashScreenView: View {
    @State var hasTimeElapsed: Bool = false
    
    var body: some View {
        MainNavigationView()
    }
    
    private func delayActivity() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            hasTimeElapsed = true
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
