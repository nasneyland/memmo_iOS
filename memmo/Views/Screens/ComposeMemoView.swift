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
    
    @State private var selection: Int? = 2
    @State private var selectedType: MemoType = MemoType()
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack() {
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
                            Button(selectedType.emoji == "" ? "🫥" : selectedType.emoji) {
                                showEmojiPicker = true
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            TextField("예) 좋아하는 음료는?", text: $selectedType.title)
                                .disabled(selection == 0)
                            Button("+") {
                                showEmojiPicker = true
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .foregroundColor(.black)
                        }
                    }
                    Section(header:Text("내용")
                        .bold()
                        .foregroundColor(Color.black)
                    ){
                        TextField("예) 아이스 바닐라 라떼", text: $content)
                    }
                    Button {
                        if selectedType.emoji != "" && selectedType.title != "" && content != "" {
                            if selection == 0 {
                                let memo = person!.memos.filter({$0.type.id == selectedType.id})
                                
                                if memo.count == 1 {
                                    viewModel.updateMemo(id: memo.first!.id, content: content)
                                } else {
                                    viewModel.addMemo(person: person!.id, type: selectedType.id, content: content)
                                }
                            } else {
                                viewModel.addMemo(person: person!.id, emoji: selectedType.emoji, title: selectedType.title, content: content)
                            }
                            dismiss()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("추가하기")
                                .foregroundColor(selectedType.emoji == "" || selectedType.title == "" || content == "" ? .light_gray : .black)
                            Spacer()
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.system_gray)
                .sheet(isPresented: $showEmojiPicker) {
                    NavigationView {
                        EmojiPickerView(person: person!, content: $content, selectedType: $selectedType, selection: $selection)
                            .navigationTitle("이모지")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        }
    }
}
