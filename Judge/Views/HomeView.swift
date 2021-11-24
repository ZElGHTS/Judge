import SwiftUI

struct HomeView: View {
    var body: some View {
        // Check if saved data is empty ? MessageEmptyView : List of the saved data
        MessageEmptyView(title: "Nothing to see here...", message: "You don't have any workout saved! \nGo to the receive tab to save the latest of your workouts.", icon: "moon.zzz")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
