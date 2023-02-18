//
//  MemoViewModel.swift
//  memmo
//
//  Created by najin on 2023/02/19.
//

import SwiftUI

class MemoViewModel: ObservableObject {
    @Published var list: [Memo] = []
    
    init() {
        list = [
            Memo(emoji: "🥤", content: "흑당버블티", person: Person(name: "김영희", category: Category(name: "친구들", color: .category01))),
            Memo(emoji: "👔", content: "100사이즈", person: Person(name: "김철수", category: Category(name: "친구들", color: .category01))),
            Memo(emoji: "🥤", content: "아이스바닐라라떼", person: Person(name: "엄마", category: Category(name: "가족들", color: .category02)))
        ]
    }
}
