//
//  CategoryCell.swift
//  memmo
//
//  Created by najin on 2023/02/23.
//

import SwiftUI

struct CategoryCell: View {
    
    var category: Category
    
    @Binding var showPersonComposer: Bool
    @Binding var selectedPerson: Person?
    @Binding var selectedPersonCategory: Category?
    
    @Binding var showMemoDetail: Bool
    @Binding var selectedMemoPerson: Person?
    @Binding var selectedMemoCategory: Category?
    
    @State private var isOpened: Bool = false
    
    var body: some View {
        VStack() {
            HStack() {
                Image("folder_\(isOpened ? "gray" : category.color)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                VStack(alignment: .leading) {
                    Text(category.name)
                        .font(.body)
                    Text("멤버 수 \(category.persons.count)명")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                if category.persons.count == 0 || isOpened {
                    Button() {
                        selectedPersonCategory = category
                        selectedPerson = nil
                        showPersonComposer = true
                    } label: {
                        Label("멤버 추가하기", systemImage: "plus")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                    }
                } else {
                    ZStack(alignment: .trailing) {
                        ForEach(Array(zip(category.persons.prefix(5).indices, category.persons.prefix(5))), id: \.0) { (i,person) in
                            ProfileImage(size: 35, image: loadImageFromDocumentDirectory(imageName: person.id.stringValue))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: CGFloat(20 * i)))
                        }
                    }
                }
            }
            .onTapGesture {
                if !category.persons.isEmpty {
                    isOpened.toggle()
                }
            }
            if isOpened {
                ForEach(category.persons) { person in
                    PersonCell(category: category, person: person)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                        .onTapGesture {
                            selectedMemoCategory = category
                            selectedMemoPerson = person
                            showMemoDetail = true
                        }
                }
            }
        }
    }
}
