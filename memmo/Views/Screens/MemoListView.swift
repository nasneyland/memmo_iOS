//
//  MemoListView.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

enum AlertType {
    case deleteCategory
    case deletePerson
}
struct MemoListView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    
    @State private var showAlert: Bool = false
    @State private var alertType: AlertType = .deleteCategory
    
    @State private var typeSelection: Int = 0
    private let viewOptions: [String] = ["그룹", "멤버", "메모"]
    
    // 그룹 관련 변수
    @State private var selectedCategory: Category?
    @State private var showCategoryComposer: Bool = false
    
    // 사람 관련 변수
    @State private var selectedPerson: Person?
    @State private var selectedPersonCategory: Int?
    @State private var showPersonComposer: Bool = false
    
    // 메모 관련 변수
    @State private var selectedMemoPerson: Person?
    @State private var selectedMemoCategory: Category?
    @State private var showMemoDetail: Bool = false
    
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
                            ForEach(Array(zip(viewModel.categoryList.indices, viewModel.categoryList)), id: \.0) { (index,category) in
                                CategoryCell(category: (index, category), showPersonComposer: $showPersonComposer, selectedPerson: $selectedPerson, selectedPersonCategory: $selectedPersonCategory, showMemoDetail: $showMemoDetail, selectedMemoPerson: $selectedMemoPerson, selectedMemoCategory: $selectedMemoCategory)
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
                                                alertType = .deleteCategory
                                                self.showAlert = true
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
                            ForEach(Array(zip(viewModel.categoryList.indices, viewModel.categoryList)), id: \.0) { (index,category) in
                                ForEach(category.persons) { person in
                                    PersonCell(category: category, person: person)
                                        .onTapGesture {
                                            selectedMemoCategory = category
                                            selectedMemoPerson = person
                                            showMemoDetail = true
                                        }
                                        .contextMenu {
                                            Button() {
                                                selectedPersonCategory = index
                                                selectedPerson = person
                                                showPersonComposer = true
                                            } label: {
                                                Label("수정하기", systemImage: "pencil.circle")
                                            }
                                            Button(role: .destructive) {
                                                selectedPerson = person
                                                alertType = .deletePerson
                                                showAlert = true
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
                    if viewModel.memoTypeList.isEmpty {
                        Text("새 메모를 생성해주세요.")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            ForEach(viewModel.memoTypeList.indices, id: \.self) { i in
                                MemoCell(type: viewModel.memoTypeList[i], memos: viewModel.memoList[i])
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 20))
                        .listStyle(.sidebar)
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
                Button {
                    selectedCategory = nil
                    showCategoryComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .foregroundColor(.black)
            .sheet(isPresented: $showCategoryComposer) {
                ComposeCategoryView(category: $selectedCategory)
            }
            .sheet(isPresented: $showPersonComposer) {
                ComposePersonView(person: $selectedPerson, categoryIndex: $selectedPersonCategory)
            }
            .sheet(isPresented: $showMemoDetail) {
                DetailView(category: $selectedMemoCategory, person: $selectedMemoPerson)
            }
            .alert(isPresented: $showAlert) {
                switch alertType {
                case .deleteCategory:
                    return Alert(title: Text("삭제할 수 없음"), message: Text("그룹에 멤버가 존재하는지 확인해주세요"), dismissButton: .default(Text("확인")))
                case .deletePerson:
                    return Alert(
                        title: Text("멤버 삭제하기"),
                        message: Text("해당 멤버의 메모가 전부 삭제됩니다. 정말 삭제하시겠습니까?"),
                        primaryButton: .destructive(Text("삭제")) {
                            print("삭제")
                            viewModel.deletePerson(id: selectedPerson!.id)
                        },
                        secondaryButton: .cancel(Text("취소"))
                    )
                }
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
