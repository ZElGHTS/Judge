import SwiftUI

struct ButtonRowView: View {
    @EnvironmentObject var activityManager: ActivityManager
    var activity: String
    
    var body: some View {
        Button(action: {
            activity == "services" ? activityManager.serviceActivity.toggle() : activityManager.trainingActivity.toggle()
        }) {
            HStack {
                Subject(activity: activity)
                
                Spacer()
                
                InfoButton(activity: activity)
            }
        }
    }
}


struct Subject: View {
    var activity: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if activity == "services" {
                Image("tennis-serviceV2")
                    .renderingMode(.template)
                    .foregroundColor(Color.init("SecondaryColor"))
            } else {
                Image("tennis-player")
                    .renderingMode(.template)
                    .foregroundColor(Color.init("SecondaryColor"))
            }
            
            
            Text(activity == "services" ? "Services" : "Training")
                .bold()
                .font(.system(size: 15))
            Text(activity == "services" ? "OPEN GOAL" : "1 - 3 HOURS")
                .bold()
                .font(.system(size: 15))
                .foregroundColor(Color.init("SecondaryColor"))
        }
        .padding()
    }
}

struct InfoButton: View {
    @State var showInformation = false
    var activity: String
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button(action: {
                self.showInformation.toggle()
            }) {
                MoreButton()
            }
            .sheet(isPresented: $showInformation) {
                ScrollView {
                    Text(activity == "services" ? "Welcome to the services activity. In this activity, you will be able to practice your serves in precise details, while keeping track on your health. This activity doesn't have a time goal. You will be able to share it to your iPhone after ending it." : "Welcome to the training activity. Here, you will be able to observe your your heart rate, energy consumption, and more! This activity has a time goal of 1 hour to 3 hours. You will be able to share it to your iPhone after ending it.")
                        .toolbar(content: {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Close") { self.showInformation.toggle() }
                            }
                         })
                    Button(action: { self.showInformation = false }) {
                        Text("OK")
                    }
                    .padding()
                    .scenePadding()
                }
                .navigationBarHidden(true)
                .scenePadding()
            }
            .offset(x: 6, y: -27)
            .frame(width: 25, height: 25)
            .buttonStyle(.plain)
        }
        .padding()
    }
}

struct MoreButton: View {
    var body: some View {
        return Image(systemName: "ellipsis.circle")
            .resizable()
            .foregroundColor(Color.init("SecondaryColor"))
            .frame(width: 25, height: 25)
    }
}

struct ButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRowView(activity: "services")
    }
}
