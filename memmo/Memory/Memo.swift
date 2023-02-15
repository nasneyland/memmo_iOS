//
//  Memo.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    
    //Identifiable 필수 속성
    let id: UUID
    
    var emoji: String
    var content: String
    var person: Person
    
    //생성자
    init(emoji: String, content: String, person: Person) {
        id = UUID()
        self.emoji = emoji
        self.content = content
        self.person = person
    }
}
