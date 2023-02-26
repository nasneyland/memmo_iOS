//
//  Person.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import Foundation
import RealmSwift

class Person: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    @Persisted var memos = RealmSwift.List<Memo>()
    @Persisted var category = LinkingObjects(fromType: Category.self, property: "persons")
    
    override class func primaryKey() -> String? {
        "id"
    }
}
