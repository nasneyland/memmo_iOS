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
    @ObservedResults(Person.self) var personDatas
    @ObservedResults(Memo.self) var memoDatas
    
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
        setCategory()
        setPerson()
    }
    
    func deleteCategory(id: ObjectId) {
        do {
            let realm = try Realm()
            guard let category = realm.object(ofType: Category.self, forPrimaryKey: id) else { return }
            try! realm.write{
                realm.delete(category)
            }
        }
        catch {
            print(error)
        }
        setCategory()
    }
    
    //MARK: - 사람
    
    private func setPerson() {
        personList = []
        categoryList.forEach { personList += $0.persons }
    }
    
    func addPerson(name: String, imageData: Data?, categoryId: ObjectId) {
        let person = Person()
        person.name = name
        if let data = imageData {
            updateCategory(id: categoryId, person: person, image: UIImage(data: data))
        } else {
            updateCategory(id: categoryId, person: person, image: nil)
        }
    }
    
    func updatePerson(id: ObjectId, memo: Memo) {
        do {
            let realm = try Realm()
            guard let person = realm.object(ofType: Person.self, forPrimaryKey: id) else { return }
            try realm.write {
                person.memos.append(memo)
            }
        }
        catch {
            print(error)
        }
    }
    
    func deletePerson(id: ObjectId) {
        do {
            let realm = try Realm()
            guard let person = realm.object(ofType: Person.self, forPrimaryKey: id) else { return }
            try! realm.write{
                realm.delete(person)
            }
        }
        catch {
            print(error)
        }
        setPerson()
        setCategory()
    }
    
    //MARK: - 메모

    func addMemo(person: ObjectId, emoji: String, title: String, content: String) {
        let memoType = MemoType()
        memoType.emoji = emoji
        memoType.title = title
        
        let memo = Memo()
        memo.type = memoType
        memo.content = content
        
        updatePerson(id: person, memo: memo)
    }
}
