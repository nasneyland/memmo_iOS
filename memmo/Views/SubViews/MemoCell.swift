//
//  MemoCell.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct MemoCell: View {
    
    var body: some View {
        HStack(alignment: .center) {
            ProfileImage()
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("name")
                        .font(.body)
                        .lineLimit(1)
                    Text("catogory")
                        .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
//                        .background(memo.person.category.color)
                        .cornerRadius(8)
                        .font(.caption)
                        .lineLimit(1)
                }
                Text("content")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell()
    }
}