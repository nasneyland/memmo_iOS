//
//  MemoCell.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct MemoCell: View {
    
    var type: MemoType
    var memos: [(Person, String)]
    
    @State private var isOpened: Bool = false
    
    var body: some View {
        VStack() {
            MemoTypeCell(type: type, memoCount: memos.count)
            .onTapGesture {
                if !memos.isEmpty {
                    isOpened.toggle()
                }
            }
            
            if isOpened {
                VStack {
                    ForEach(memos.indices, id: \.self) { i in
                        HStack {
                            Image(systemName: "arrow.turn.down.right")
                                .foregroundColor(Color.light_gray)
                            HStack {
                                Text("\(memos[i].0.name) : \(memos[i].1)")
                                    .font(.caption)
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.system_gray)
                            .cornerRadius(15)
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 0))
                    }
                }
            }
        }
    }
}

