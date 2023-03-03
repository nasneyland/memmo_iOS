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
    
    private let viewOptions: [String] = ["내이모지", "전체"]
    @State private var typeSelection: Int = 0
    
    @State var person: Person
    @Binding var content: String
    @Binding var selectedType: MemoType
    @Binding var selection: Int?
    
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
                    if viewModel.memoTypeList.count == 0 {
                        Text("내 이모지를 생성해주세요.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(Array(zip(viewModel.memoTypeList.indices, viewModel.memoTypeList)), id: \.0) { (i,type) in
                            HStack {
                                Text(type.emoji)
                                    .font(.system(size: 30))
                                    .padding(10)
                                    .background(Color.system_gray)
                                    .cornerRadius(15)
                                Text(type.title)
                                    .font(.body)
                                Spacer()
                                if person.memos.filter {$0.type.id == type.id}.count == 1 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color.blue)
                                }
                            }
                            .onTapGesture {
                                content = person.memos.filter {$0.type.id == type.id}.first?.content ?? ""
                                selectedType = type
                                selection = typeSelection
                                dismiss()
                            }
                        }
                    }
                case 1:
                    ForEach(Emoji.list, id:\.self.0) { type in
                        HStack() {
                            Text(type.0)
                                .font(.system(size: 15))
                                .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                            Spacer()
                        }
                        LazyVGrid(columns: columns) {
                            ForEach(type.1, id:\.self) { emoji in
                                Text(emoji)
                                    .font(.system(size: 30))
                                    .padding(10)
                                    .background(Color.system_gray)
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        selectedType = MemoType(emoji: emoji)
                                        selection = typeSelection
                                        dismiss()
                                    }
                            }
                        }
                    }
                default:
                    Text("이모지 정보가 없습니다.")
                }
            }
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        }
    }
}
