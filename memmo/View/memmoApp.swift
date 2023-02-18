//
//  memmoApp.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

@main
struct memmoApp: App {
    
    // 모든 뷰에서 사용하는 공통 데이터 선언
    @StateObject var viewModel = MemoViewModel()
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MemoListView(viewModel: viewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewModel)
        }
    }
}
