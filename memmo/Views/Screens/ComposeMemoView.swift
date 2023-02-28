//
//  ComposeMemoView.swift
//  memmo
//
//  Created by najin on 2023/02/27.
//

import SwiftUI

struct ComposeMemoView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var person: Person?
    
    @State private var showEmojiPicker: Bool = false
    @State private var emoji: String = ""
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // 네비게이션
                Text("새 메모 생성")
                    .font(.headline)
                    .navigationBarTitle(Text(""))
                    .navigationBarItems(trailing: Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    }))
                    .foregroundColor(.black)
                
                Form {
                    Section(header: Text("제목")
                        .bold()
                        .foregroundColor(Color.black)
                    ){
                        HStack() {
                            Button(emoji == "" ? "🫥" : emoji) {
                                
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            TextField("예) 좋아하는 음료는?", text: $title)
                            Button("+") {
                                showEmojiPicker = true
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .foregroundColor(.black)
                        }
                    }
                    Section(header: Text("내용")
                        .bold()
                        .foregroundColor(Color.black)
                    ){
                        TextField("예) 아이스 바닐라 라떼", text: $content)
                    }
                    Button {
                        if emoji != "" && title != "" && content != "" {
//                            viewModel.addMemo(person: person!.id, emoji: emoji, title: title, content: content)
                            viewModel.addMemo(person: person!.id, type: viewModel.memoTypeDatas.first!.id, content: "test")
                            dismiss()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("추가하기")
                                .foregroundColor(emoji == "" || title == "" || content == "" ? .light_gray : .black)
                            Spacer()
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.system_gray)
            }
            .sheet(isPresented: $showEmojiPicker) {
                NavigationView {
                    EmojiPickerView(selectedEmoji: $emoji)
                        .navigationTitle("이모지")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}
