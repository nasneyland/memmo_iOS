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
    
    @Binding var category: Category?
    @Binding var person: Person?
    
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
                            if let category = category {
                                HStack() {
                                    Image("folder_\(category.color)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 20)
                                    Text(category.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
//                                .padding(10)
//                                .background(.white)
//                                .cornerRadius(10)
                            } else {
        //                        Picker("", selection: $categorySelection) {
        //                            ForEach(Array(zip(viewModel.categoryList.indices, viewModel.categoryList)), id: \.0) { (i,category) in
        //                                Text(category.name)
        //                                    .tag(category.id)
        //                            }
        //                        }
                            }
                        }
                        Button {
                            if category != nil && !personName.isEmpty {
                                if let person = person {
                                    viewModel.addPerson(name: personName, imageData: selectedImageData, categoryId: category!.id)
                                } else {
                                    viewModel.addPerson(name: personName, imageData: selectedImageData, categoryId: category!.id)
                                }
                                dismiss()
                            }
                        } label: {
                            HStack {
                                Spacer()
                                Text(person == nil ? "생성하기" : "수정하기")
                                    .foregroundColor(category == nil || personName.isEmpty ? .light_gray : .black)
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
            if let person = person {
                personName = person.name
            }
        }
    }
}
