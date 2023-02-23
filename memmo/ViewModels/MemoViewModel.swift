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
    @ObservedResults(Person.self) var personDatas
    
    @Published var categoryList: [Category] = []
    @Published var personList: [Person] = []
    
    init() {
        setCategory()
        setPerson()
    }
    
    //MARK: - 카테고리
    
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
    
    //MARK: - 사람
    
    private func setPerson() {
        personList = Array(personDatas)
    }
    
    func addPerson(name: String, image: String, category: Category) {
        let person = Person()
        person.name = name
        person.image = image
        $personDatas.append(person)
        setPerson()
    }
}

