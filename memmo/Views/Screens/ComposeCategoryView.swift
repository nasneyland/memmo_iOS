//
//  ComposeCategoryView.swift
//  memmo
//
//  Created by najin on 2023/02/19.
//

import SwiftUI

struct ComposeCategoryView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var category: Category?
    
    @State private var name: String = ""
    @State private var color: String = ""
    
    let colorSet: [String] = ["red", "orange", "yellow", "green", "blue", "purple"]
    
    var body: some View {
        NavigationView {
            VStack {
                // 네비게이션
                Text(category == nil ? "새 그룹 생성" : "그룹 편집")
                    .font(.headline)
                    .navigationBarTitle(Text(""))
                    .navigationBarItems(trailing: Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    }))
                    .foregroundColor(.black)
                
                Form {
                    Section(header: Text("이름")
                        .bold()
                        .foregroundColor(Color.black)
                    ){
                        TextField("카테고리명을 입력해주세요.", text: $name)
                    }
                    
                    Section(header: Text("색상")
                        .bold()
                        .foregroundColor(Color.black)
                    ){
                        HStack {
                            Spacer()
                            
                            ForEach(colorSet, id: \.self) { c in
                                Button("") {
                                    self.color = c
                                }
                                .buttonStyle(ColorButton(backgroundColor: c))
                                .disabled(color == c)
                                Spacer()
                            }
                        }
                    }

                    Button {
                        if !name.isEmpty && !color.isEmpty {
                            if let category = category {
                                viewModel.updateCategory(id: category.id, name: name, color: color)
                            } else {
                                viewModel.addCategory(name: name, color: color)
                            }
                            dismiss()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(category == nil ? "생성하기" : "수정하기")
                                .foregroundColor(name.isEmpty || color.isEmpty ? .light_gray : .black)
                            Spacer()
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.system_gray)
            }
        }
        .onAppear() {
            // 받아온 변수 초기화
            if let category = category {
                color = category.color
                name = category.name
            }
        }
    }
}
