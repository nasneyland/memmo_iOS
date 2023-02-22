//
//  Migrator.swift
//  memmo
//
//  Created by najin on 2023/02/19.
//

import Foundation
import RealmSwift

class Migrator {
    
    init() {
        updateSchema()
    }

    // 배포 할 때마다 관리하기!
    func updateSchema() {
//        // 스키마가 변경됐으면 하위 버전에 스키마 변경사항 알려주기
//        let config = Realm.Configuration(schemaVersion: 0) { migration, oldSchemaVersion in
//            if oldSchemaVersion < 0 {
//                // 변경사항
//            }
//        }
//
//        Realm.Configuration.defaultConfiguration = config
    }
}
