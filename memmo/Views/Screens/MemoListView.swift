//
//  MemoListView.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct MemoListView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    
    @State private var typeSelection = 1
    
    @State private var showCategoryComposer: Bool = false
    @State private var selectedCategory: Category? = nil
    
    @State private var showPersonComposer: Bool = false
    @State private var selectedPerson: Person? = nil
    
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
                    // 그룹 보기
                    if viewModel.categoryList.isEmpty {
                        Text("새 그룹을 생성해주세요.")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(Array(zip(viewModel.categoryList.indices, viewModel.categoryList)), id: \.0) { (i,category) in
                                    CategoryCell(category: category)
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
                    // 사람 보기
                    if viewModel.personList.isEmpty {
                        Text("새 멤버를 생성해주세요.")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(viewModel.categoryList) { category in
                                    ForEach(category.persons) { person in
                                        PersonCell(category: category, person: person)
                                    }
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                case 2:
                    Text("리스트보기")
                default:
                    Text("리스트가 존재하지 않습니다.")
                }
                Spacer()
            }
            
            // 네비게이션 타이틀 설정
            .navigationTitle("Memmo")
            
            // 네비게이션 버튼 설정
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button(action: {
                            selectedCategory = nil
                            showCategoryComposer = true
                        }) {
                            HStack {
                                Text("새 그룹 추가하기")
                                Image(systemName: "folder.circle")
                            }
                        }
                        Button(action: {
                            selectedPerson = nil
                            showPersonComposer = true
                        }) {
                            HStack {
                                Text("새 멤버 추가하기")
                                Image(systemName: "person.circle")
                            }
                        }
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .foregroundColor(.black)
            .sheet(isPresented: $showCategoryComposer) {
                ComposeCategoryView(category: selectedCategory)
            }
            .sheet(isPresented: $showPersonComposer) {
                ComposePersonView(person: selectedPerson)
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
