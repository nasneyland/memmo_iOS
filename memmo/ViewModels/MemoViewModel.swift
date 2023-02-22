//
//  MemoViewModel.swift
//  memmo
//
//  Created by najin on 2023/02/19.
//

import SwiftUI
import RealmSwift

class MemoViewModel: ObservableObject {
    
    @ObservedResults(Category.self) var categoryDatas
    
    @Published var categoryList: [Category] = []
    
    init() {
        setCategory()
    }
    
    private func setCategory() {
        categoryList = Array(categoryDatas)
    }
    
    func addCategory(name: String, color: String = "gray") {
        let category = Category()
        category.name = name
        category.color = color
        $categoryDatas.append(category)
        setCategory()
    }
    
    func updateCategory(id: ObjectId, name: String, color: String = "gray") {
        do {
            let realm = try Realm()
            guard let category = realm.object(ofType: Category.self, forPrimaryKey: id) else { return }
            try realm.write {
                category.name = name
                category.color = color
            }
        }
        catch {
            print(error)
        }
        setCategory()
    }
    
    func deleteCategory(index: Int) {
        $categoryDatas.remove(atOffsets: [index])
        setCategory()
    }
}

