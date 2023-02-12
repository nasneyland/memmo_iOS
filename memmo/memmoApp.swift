//
//  memmoApp.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

@main
struct memmoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
