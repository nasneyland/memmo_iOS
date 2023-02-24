//
//  CategoryCell.swift
//  memmo
//
//  Created by najin on 2023/02/23.
//

import SwiftUI

struct CategoryCell: View {
    
    @ObservedObject var category: Category
    
    var body: some View {
        VStack {
            Image("folder_\(category.color.isEmpty ? "gray" : category.color)")
                .resizable()
                .frame(width: 80, height: 70)
                .scaledToFit()
            Text(category.name)
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: Category())
    }
}
