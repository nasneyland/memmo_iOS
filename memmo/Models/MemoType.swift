//
//  MemoType.swift
//  memmo
//
//  Created by najin on 2023/02/27.
//

import Foundation
import RealmSwift

class MemoType: Object, Identifiable {

    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var emoji: String
    @Persisted var title: String

    override class func primaryKey() -> String? {
        "id"
    }
}
