//
//  Top5App.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import SwiftUI

@main
struct Top5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
