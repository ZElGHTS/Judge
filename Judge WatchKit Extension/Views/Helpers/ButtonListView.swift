import SwiftUI

struct ButtonListView: View {
    @EnvironmentObject var activityManager: ActivityManager
    
    var body: some View {
        ButtonList()
            .environmentObject(activityManager)
    }
}

struct ButtonList: View {
    @EnvironmentObject var activityManager: ActivityManager
    
    var body: some View {
        return List {
            ButtonRowView(activity: "services")
                .environmentObject(activityManager)
            ButtonRowView(activity: "training")
                .environmentObject(activityManager)
        }
        .listStyle(CarouselListStyle())
        .navigationTitle(
            Text("Judge")
        )
    }
    
}

struct ButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonListView()
    }
}
