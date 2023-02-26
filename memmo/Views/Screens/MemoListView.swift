//
//  MemoListView.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct MemoListView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    
    // 그룹 관련 변수
    @State private var selectedCategory: Category?
    @State private var showCategoryComposer: Bool = false
    @State private var deleteCategoryAlert: Bool = false
    
    // 사람 관련 변수
    @State private var selectedPerson: Person?
    @State private var selectedPersonCategory: Category?
    @State private var showPersonComposer: Bool = false
    @State private var deletePersonAlert: Bool = false
    
    // 메모 관련 변수
    @State private var selectedMemoPerson: Person?
    @State private var selectedMemoCategory: Category?
    @State private var showMemoDetail: Bool = false
    
    @State private var typeSelection: Int = 0
    
    private let viewOptions: [String] = ["그룹", "사람", "메모"]
    
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
                            ForEach(viewModel.categoryList) { category in
                                CategoryCell(category: category, showMemoDetail: $showMemoDetail, showPersonComposer: $showPersonComposer, selectedPerson: $selectedPerson, selectedPersonCategory: $selectedPersonCategory)
                                    .contextMenu {
                                        Button() {
                                            selectedCategory = category
                                            showCategoryComposer = true
                                        } label: {
                                            Label("수정하기", systemImage: "pencil.circle")
                                        }
                                        Button(role: .destructive) {
                                            if category.persons.count == 0 {
                                                viewModel.deleteCategory(id: category.id)
                                            } else {
                                                self.deleteCategoryAlert = true
                                            }
                                        } label: {
                                            Label("삭제하기", systemImage: "trash.circle")
                                        }
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 20))
                    }
                case 1:
                    // 사람 보기
                    if viewModel.personList.isEmpty {
                        Text("새 멤버를 생성해주세요.")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            ForEach(viewModel.categoryList) { category in
                                ForEach(category.persons) { person in
                                    PersonCell(category: category, person: person)
                                        .onTapGesture {
                                            selectedMemoCategory = category
                                            selectedMemoPerson = person
                                            showMemoDetail = true
                                        }
                                        .contextMenu {
                                            Button() {
                                                selectedPersonCategory = category
                                                selectedPerson = person
                                                showPersonComposer = true
                                            } label: {
                                                Label("수정하기", systemImage: "pencil.circle")
                                            }
                                            Button(role: .destructive) {
                                                viewModel.deletePerson(id: person.id)
                                            } label: {
                                                Label("삭제하기", systemImage: "trash.circle")
                                            }
                                        }
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 20))
                        }
                    }
                case 2:
                    // 메모 보기
                    if viewModel.personList.isEmpty {
                        Text("새 메모를 생성해주세요.")
                            .foregroundColor(.gray)
                    } else {
                        List {
                            ForEach(viewModel.personList) { person in
                                Section(header: Text("🧃")) {
                                    MemoCell()
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 20))
                        .listStyle(.plain)
                    }
                default:
                    Text("리스트가 존재하지 않습니다.")
                }
                Spacer()
            }
            
            // 네비게이션 타이틀 설정
            .navigationTitle("Memmo")
            
            // 네비게이션 버튼 설정
            .toolbar {
                Button(action: {
                    selectedCategory = nil
                    showCategoryComposer = true
                }) {
                    HStack {
                        Image(systemName: "plus")
                    }
                }
            }
            .foregroundColor(.black)
            .sheet(isPresented: $showCategoryComposer) {
                ComposeCategoryView(category: $selectedCategory)
            }
            .sheet(isPresented: $showPersonComposer) {
                ComposePersonView(category: $selectedPersonCategory, person: $selectedPerson)
            }
            .sheet(isPresented: $showMemoDetail) {
                DetailMemoView(category: $selectedMemoCategory, person: $selectedMemoPerson)
            }
            .alert(isPresented: $deleteCategoryAlert) {
                Alert(title: Text("삭제할 수 없음"), message: Text("그룹에 멤버가 존재하는지 확인해주세요"), dismissButton: .default(Text("확인")))
            }
            .alert(isPresented: $deletePersonAlert) {
                Alert(title: Text("멤버 삭제하기"), message: Text("정말 삭제하시겠습니까?"), dismissButton: .default(Text("확인")))
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
