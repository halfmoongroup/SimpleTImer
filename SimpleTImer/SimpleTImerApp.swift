//
//  SimpleTImerApp.swift
//  SimpleTImer
//
//  Created by tony giaccone on 3/22/24.
//

import SwiftUI

@main
struct SimpleTImerApp: App {
    var model  = TimerModel()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
