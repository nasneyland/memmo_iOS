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
    @Persisted var image: String
    
    @Persisted(originProperty: "persons") var category: LinkingObjects<Category>
    
    override class func primaryKey() -> String? {
        "id"
    }
}
