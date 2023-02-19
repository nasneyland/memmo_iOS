//
//  Category.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import Foundation
import RealmSwift
import SwiftUI

class Category: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}
