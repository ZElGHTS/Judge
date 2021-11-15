//
//  JudgeApp.swift
//  Judge WatchKit Extension
//
//  Created by Samuel Tessier on 2021-11-14.
//

import SwiftUI

@main
struct JudgeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
