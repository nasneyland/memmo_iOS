//
//  EmojiPickerView.swift
//  memmo
//
//  Created by najin on 2023/02/27.
//

import SwiftUI

struct EmojiPickerView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var typeSelection: Int = 0
    private let viewOptions: [String] = ["내이모지", "추천", "전체"]
    
    @Binding var selectedEmoji: String
    
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        VStack {
            // 타입 고르기
            Picker(selection: $typeSelection,
                   label: Text(""),
                   content: {
                ForEach(Array(zip(viewOptions.indices, viewOptions)), id: \.0) { (i,option) in
                    Text(option)
                        .tag(i)
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding(EdgeInsets(top: 3, leading: 20, bottom: 3, trailing: 20))
            
            ScrollView {
                switch typeSelection {
                case 0:
                    ForEach(viewModel.memoTypeList) { type in
                        HStack {
                            Text(type.emoji)
                                .font(.system(size: 30))
                            Text(type.title)
                                .font(.system(size: 15))
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.dark_blue)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                        }
                        .padding(10)
                        .background(Color.system_gray)
                        .cornerRadius(15)
                    }
                case 1:
                    Text("111")
                case 2:
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
                default:
                    Text("이모지 정보가 없습니다.")
                }
            }
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        }
    }
}
