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
        categoryList = Array(categoryDatas)
    }
    
    func addCategory(name: String) {
        let category = Category()
        category.name = name
        $categoryDatas.append(category)
        self.categoryList.append(category)
    }
}

//MARK: - 데모 데이터

// 메모 데이터
let DemoMemos = [
    Memo(emoji: "🥤", content: "흑당버블티", person: Person(name: "김영희")),
    Memo(emoji: "👔", content: "100사이즈", person: Person(name: "김철수")),
    Memo(emoji: "🥤", content: "아이스바닐라라떼", person: Person(name: "엄마"))
]

