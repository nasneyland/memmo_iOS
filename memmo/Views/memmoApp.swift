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
    
    // Realm DB 마이그레이션 (변경된 사항 마이그레이션 체크)
    let migrator = Migrator()
    
    // 모든 뷰에서 사용하는 공통 데이터 선언
    @StateObject var viewModel = MemoViewModel()
    
    // 실행 초기 호출 코드
    init() {
        // 저장 경로 확인
        let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
    }
    
    var body: some Scene {
        WindowGroup {
            MemoListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewModel) // 이어지는 뷰에서도 동일하게 사용 가능!
        }
    }
}
