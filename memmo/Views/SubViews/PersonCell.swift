//
//  PersonCell.swift
//  memmo
//
//  Created by najin on 2023/02/23.
//

import SwiftUI
import RealmSwift

struct PersonCell: View {
    
    var category: Category
    var person: Person
    
    var body: some View {
        HStack() {
            ProfileImage(image: loadImageFromDocumentDirectory(imageName: person.id.stringValue))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 5))
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(person.name)
                        .font(.body)
                    Text(category.name)
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                        .background(Color("light_\(category.color)"))
                        .cornerRadius(8)
                    Spacer()
                }
                Text("메모 수 \(person.memos.count)개")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Text(person.memos.map{$0.type.emoji}.reduce("",+))
                .font(.system(size: 15))
        }
    }
}
