//
//  Memo.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import Foundation
import RealmSwift

class Memo: Object, Identifiable {

    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var emoji: String
    @Persisted var content: String
    @Persisted var person: Person?

    override class func primaryKey() -> String? {
        "id"
    }
}
