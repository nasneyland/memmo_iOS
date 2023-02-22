//
//  MemoListView.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct MemoListView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    
    @State private var typeSelection = 0
    @State private var listSelction = 0
    
    @State private var showCategoryComposer: Bool = false
    @State private var selectedCategory: Category? = nil
    
    let viewOptions: [String] = ["그룹", "사람", "메모"]
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack() {
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
                
                Spacer()
                
                switch typeSelection {
                case 0:
                    // 카테고리 보기
                    if viewModel.categoryList.isEmpty {
                        Text("카테고리를 생성해주세요.")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(Array(zip(viewModel.categoryList.indices, viewModel.categoryList)), id: \.0) { (i,category) in
                                    VStack {
                                        Image("folder_\(category.color.isEmpty ? "gray" : category.color)")
                                            .resizable()
                                            .frame(width: 80, height: 70)
                                            .scaledToFit()
                                        Text(category.name)
                                    }
                                    .onTapGesture {
                                        print(category.name)
                                    }
                                    .contextMenu {
                                        Button() {
                                            selectedCategory = category
                                            showCategoryComposer = true
                                        } label: {
                                            Label("수정하기", systemImage: "pencil.circle")
                                        }
                                        Button(role: .destructive) {
                                            viewModel.deleteCategory(index: i)
                                        } label: {
                                            Label("삭제하기", systemImage: "trash.circle")
                                        }
                                    }
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                case 1:
                    Text("프로필보기")
                case 2:
                    Text("리스트보기")
//                    List {
//                        ForEach(viewModel.list) { memo in
//                            NavigationLink {
//                                DetailMemoView(memo: memo)
//                            } label: {
//                                MemoCell(memo: memo)
//                            }
//                        }
//
//                    }
//                    .listStyle(.plain)
                default:
                    Text("리스트가 존재하지 않습니다.")
                }
                
                Spacer()
            }
            
            // 네비게이션 바 설정
            .navigationTitle("Memmo")
            .toolbar {
                Button {
                    selectedCategory = nil
                    showCategoryComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .foregroundColor(.black)
            .sheet(isPresented: $showCategoryComposer) {
                ComposeCategoryView(category: selectedCategory)
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
