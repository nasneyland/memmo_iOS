//
//  ComposePersonView.swift
//  memmo
//
//  Created by najin on 2023/02/22.
//

import SwiftUI
import PhotosUI

struct ComposePersonView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var person: Person?
    @Binding var categoryIndex: Int!
    
    @State private var categorySelection: Int = 0
    @State private var category: Category? = nil
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @State private var personName: String = ""
    
    var body: some View {
        NavigationView {
            VStack() {
                // 네비게이션
                Text(person == nil ? "새 멤버 생성" : "멤버 편집")
                    .font(Font.headline.weight(.heavy))
                    .navigationBarTitle(Text(""))
                    .navigationBarItems(trailing: Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    }))
                    .foregroundColor(.black)
                
                // 본문
                VStack {
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            if let data = selectedImageData {
                                ProfileImage(size: 100, image: UIImage(data: data)!)
                            } else {
                                ProfileImage(size: 100)
                            }
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                    
                    Form {
                        Section(header: Text("이름")
                            .bold()
                            .foregroundColor(Color.black)
                        ){
                            TextField("멤버 이름을 입력해주세요.", text: $personName)
                        }
                        Section(header: Text("그룹")
                            .bold()
                            .foregroundColor(Color.black)
                        ){
                            Menu(content: {
                                Picker("", selection: $categorySelection) {
                                    ForEach(Array(zip(viewModel.categoryList.indices, viewModel.categoryList)), id: \.0) { (i,category) in
                                        HStack() {
                                            Image("folder_\(category.color)")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                            Text(category.name)
                                        }
                                        .tag(i)
                                    }
                                }
                            }, label: {
                                HStack {
                                    Image("folder_\(viewModel.categoryList[categorySelection].color)")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25, alignment: .center)
                                    Text(viewModel.categoryList[categorySelection].name)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            })
                            .onAppear {
                                categorySelection = categoryIndex
                            }
                        }
                        Button {
                            if !personName.isEmpty {
                                if person == nil {
                                    viewModel.addPerson(name: personName, imageData: selectedImageData, categoryId: viewModel.categoryList[categorySelection].id)
                                } else {
                                    if categoryIndex == categorySelection {
                                        viewModel.updatePerson(id: person!.id, name: personName)
                                    } else {
                                        viewModel.updatePerson(id: person!.id, name: personName, categoryId: viewModel.categoryList[categorySelection].id)
                                    }
                                    
                                }
                                dismiss()
                            }
                        } label: {
                            HStack {
                                Spacer()
                                Text(person == nil ? "생성하기" : "수정하기")
                                    .foregroundColor(personName.isEmpty ? .light_gray : .black)
                                Spacer()
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                .background(Color.system_gray)
            }
        }
        .onAppear() {
            category = viewModel.categoryList[categoryIndex]
            
            if let person = person {
                personName = person.name
            }
        }
    }
}
