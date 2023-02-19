//
//  Person.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import Foundation
import SwiftUI

class Person: Identifiable, ObservableObject {
    
    //Identifiable 필수 속성
    let id: UUID
    
    var name: String
    var image: UIImage
    var favorite: Bool
//    var category: Category
    
    //생성자
    init(name: String, image: UIImage = UIImage(imageLiteralResourceName: "profile"), favorite: Bool = false) {
        id = UUID()
        self.name = name
        self.image = image
        self.favorite = favorite
//        self.category = category
    }
}
