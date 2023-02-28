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
    @Persisted var type: MemoType!
    @Persisted var content: String
    
    @Persisted var person = LinkingObjects(fromType: Person.self, property: "memos")
    
    override class func primaryKey() -> String? {
        "id"
    }
}
