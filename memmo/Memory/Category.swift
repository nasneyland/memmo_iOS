//
//  Category.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import Foundation
import SwiftUI

class Category: Identifiable, ObservableObject {
    
    //Identifiable 필수 속성
    let id: UUID
    
    var name: String
    var color: Color
    
    //생성자
    init(name: String, color: Color = .gray) {
        id = UUID()
        self.name = name
        self.color = color
    }
}
