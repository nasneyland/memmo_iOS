//
//  memmoApp.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

@main
struct memmoApp: App {
    
    @StateObject var store = MemoStore()
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MemoListView(memoStore: MemoStore())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
