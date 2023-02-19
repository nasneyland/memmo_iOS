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
    
    let filterOptions: [String] = ["카테고리", "프로필", "리스트"]
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                // 타입 고르기
                Picker(selection: $typeSelection,
                       label: Text(""),
                       content: {
                            ForEach(filterOptions.indices) { index in
                                Text(filterOptions[index])
                                    .tag(index)
                            }
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                
                // 리스트 나타내기
                List {
                    switch typeSelection {
                    case 0:
                        if viewModel.categoryList.isEmpty {
                            Text("카테고리를 생성해주세요.")
                                .foregroundColor(.gray)
                        } else {
                            // 카테고리 리스트
                            ScrollView {
                                LazyVGrid(columns: columns) {
                                    ForEach(viewModel.categoryList, id: \.self) { category in
                                        VStack {
                                            Image(systemName: "folder")
                                                .frame(width: 100, height: 90)
                                                .background(.gray)
                                                .scaledToFill()
                                            Text(category.name)
                                        }
                                    }
                                }
                            }
                        }

                    case 1:
                        Text("프로필보기")
                    case 2:
                        Text("리스트보기")
//                        ForEach(viewModel.list) { memo in
//                            NavigationLink {
//                                DetailMemoView(memo: memo)
//                            } label: {
//                                MemoCell(memo: memo)
//                            }
//                        }
                    default:
                        Text("리스트가 존재하지 않습니다.")
                    }
                    
                }
                .listStyle(.plain)
            }
            
            // 네비게이션 바 설정
            .navigationTitle("Memmo")
            .toolbar {
                Button {
                    showCategoryComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .foregroundColor(.black)
            .sheet(isPresented: $showCategoryComposer) {
                ComposeCategoryView()
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
