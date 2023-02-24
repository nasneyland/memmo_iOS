//
//  Category.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import Foundation
import RealmSwift

class Category: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var color: String
    
    @Persisted var persons = RealmSwift.List<Person>()
    
    override class func primaryKey() -> String? {
        "id"
    }
}
