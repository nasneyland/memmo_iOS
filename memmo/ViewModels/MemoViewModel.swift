//
//  MemoViewModel.swift
//  memmo
//
//  Created by najin on 2023/02/19.
//

import SwiftUI
import RealmSwift
import UIKit

class MemoViewModel: ObservableObject {
    
    @ObservedResults(Category.self) var categoryDatas
    
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
    
    func updateCategory(id: ObjectId, person: Person, image: UIImage?) {
        do {
            let realm = try Realm()
            guard let category = realm.object(ofType: Category.self, forPrimaryKey: id) else { return }
            try realm.write {
                category.persons.append(person)
                saveImageToDocumentDirectory(imageName: "\(person.id).png", image: image)
            }
        }
        catch {
            print(error)
        }
        setPerson()
        setCategory()
    }
    
    func deleteCategory(index: Int) {
        $categoryDatas.remove(atOffsets: [index])
        setPerson()
        setCategory()
    }
    
    //MARK: - 사람
    
    private func setPerson() {
        personList = []
        categoryList.forEach { personList += $0.persons }
    }
    
    func addPerson(name: String, imageData: Data?, category: ObjectId) {
        let person = Person()
        person.name = name
        if let data = imageData {
            updateCategory(id: category, person: person, image: UIImage(data: data))
        } else {
            updateCategory(id: category, person: person, image: nil)
        }
    }
}
