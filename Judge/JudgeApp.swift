import SwiftUI

@main
struct JudgeApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .modifier(DarkModeViewModifier())
        }
    }
}

struct DarkModeViewModifier: ViewModifier {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    
    func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
