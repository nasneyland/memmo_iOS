//
//  MemoTypeCell.swift
//  memmo
//
//  Created by najin on 2023/03/01.
//

import SwiftUI

struct MemoTypeCell: View {
    
    var type: MemoType
    var memoCount: Int
    
    var body: some View {
        HStack {
            Text(type.emoji)
                .font(.system(size: 30))
                .padding(10)
                .background(Color.system_gray)
                .cornerRadius(15)
            VStack(alignment: .leading) {
                Text(type.title)
                    .font(.body)
                Text("메모 수 \(memoCount)개")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}
