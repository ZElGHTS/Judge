import SwiftUI

struct MessageEmptyView: View {
    var title: String
    var message: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 32) {
            Text(title)
                .font(.system(size: 25, weight: .bold))
                .padding()
            Image(systemName: icon)
                .font(.system(size: 72, weight: .light))
                .offset(y: -20)
            HStack {
                Spacer()
                Text(message)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}
