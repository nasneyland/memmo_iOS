//
//  PersonCell.swift
//  memmo
//
//  Created by najin on 2023/02/23.
//

import SwiftUI
import RealmSwift

struct PersonCell: View {
    
    @ObservedObject var category: Category
    @ObservedObject var person: Person
    
    var body: some View {
        VStack {
            ProfileImage()
            Text(person.name)
            Text(category.name)
        }
    }
}

struct PersonCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonCell(category: Category(), person: Person())
    }
}
