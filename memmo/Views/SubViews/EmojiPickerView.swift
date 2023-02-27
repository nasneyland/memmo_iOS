//
//  EmojiPickerView.swift
//  memmo
//
//  Created by najin on 2023/02/27.
//

import SwiftUI

struct EmojiPickerView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selectedEmoji: String
    
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            ForEach(0..<Emoji.types.count, id: \.self) { index in
                HStack() {
                    Text(Emoji.types[index])
                        .font(.system(size: 15))
                        .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 10))
                    Spacer()
                }
                LazyVGrid(columns: columns) {
                    ForEach(Emoji.values[index], id: \.self) { emoji in
                        Text(emoji)
                            .font(.system(size: 30))
                            .padding(10)
                            .background(selectedEmoji != emoji ? Color.system_gray : Color.light_orange)
                            .cornerRadius(15)
                            .onTapGesture {
                                selectedEmoji = String(emoji)
                                dismiss()
                            }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
            }
        }
    }
}
