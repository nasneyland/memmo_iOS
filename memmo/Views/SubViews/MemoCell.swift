//
//  MemoCell.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct MemoCell: View {
    
    var emoji: String?
    var memos: [Memo]?
    var persons: [Person]?
    
    var body: some View {
        HStack() {
            Text(emoji ?? "")
                .font(.body)
        }
    }
}

