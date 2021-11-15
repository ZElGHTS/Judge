import SwiftUI

struct AppImage: View {
    var body: some View {
        return Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipped()
            .cornerRadius(150)
            .padding()
    }
}
