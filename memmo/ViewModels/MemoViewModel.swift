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
    @ObservedResults(MemoType.self) var memoTypeDatas
    @ObservedResults(Memo.self) var memoDatas
    
    @Published var categoryList: [Category] = []
    @Published var personList: [Person] = []
    @Published var memoTypeList: [MemoType] = []
    @Published var memoList: [[(Person, String)]] = [[]]
    
    init() {
        setDatas()
    }
    
    private func setDatas() {
        setCategory()
        setPerson()
        setMemo()
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
        setDatas()
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
        setDatas()
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
        setDatas()
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
        setDatas()
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
    
    func updatePerson(id: ObjectId, name: String) {
        do {
            let realm = try Realm()
            guard let person = realm.object(ofType: Person.self, forPrimaryKey: id) else { return }
            try realm.write {
                person.name = name
            }
        }
        catch {
            print(error)
        }
        setDatas()
    }
    
    func updatePerson(id: ObjectId, name: String, categoryId: ObjectId) {
        deletePerson(id: id)
        addPerson(name: name, imageData: nil, categoryId: categoryId)
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
        setDatas()
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
        setDatas()
    }
    
    //MARK: - 메모
    
    func setMemo() {
        memoTypeList = Array(memoTypeDatas)
        
        var memoDict: [MemoType: [(Person, String)]] = [:]
        
        personList.forEach { person in
            person.memos.forEach { memo in
                memoDict[memo.type, default: []].append((person, memo.content))
            }
        }
        
        self.memoTypeList = memoDict.map {$0.key}
        self.memoList = memoDict.map {$0.value}
    }

    func addMemo(person: ObjectId, type: ObjectId, content: String) {
        do {
            let realm = try Realm()
            guard let type = realm.object(ofType: MemoType.self, forPrimaryKey: type) else { return }
            let memo = Memo()
            memo.type = type
            memo.content = content
            updatePerson(id: person, memo: memo)
        }
        catch {
            print(error)
        }
    }
    
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
