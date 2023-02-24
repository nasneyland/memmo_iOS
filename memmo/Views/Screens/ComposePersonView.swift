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
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @State private var name: String = ""
    @State private var category: String = ""
//    @State private var image: String = ""
    @State private var categorySelection = 0
    
    var person: Person?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                // 네비게이션
                Text(person == nil ? "새 사람 생성" : "사람 편집")
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
                                ProfileImage(width: 100, height: 100, image: UIImage(data: data)!)
                            } else {
                                ProfileImage(width: 100, height: 100)
                            }
                            
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                    
                    HStack {
                        Text("이름")
                            .bold()
                            .font(.system(size: 15))
                        Spacer()
                    }
                    TextField("멤버 이름을 입력해주세요.", text: $name)
                        .textFieldStyle(FormTextField())
                    HStack {
                        Text("그룹")
                            .bold()
                            .font(.system(size: 15))
                        Spacer()
                    }
                    Picker("", selection: $categorySelection) {
                        ForEach(Array(zip(viewModel.categoryList.indices, viewModel.categoryList)), id: \.0) { (i,category) in
                            Text(category.name)
                                .tag(category.id)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(.white)
                    .cornerRadius(10)
                    
                    Button {
                        if !name.isEmpty {
                            if let person = person {
                                
                            } else {
                                viewModel.addPerson(name: name, imageData: selectedImageData, category: viewModel.categoryList[categorySelection].id)
                            }
                            dismiss()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(person == nil ? "생성하기" : "수정하기")
                                .foregroundColor(name.isEmpty ? .light_gray : .black)
                            Spacer()
                        }
                    }
                        .buttonStyle(FormButton())
                    
                    Spacer()
                }
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.system_gray)
            }
        }.onAppear() { // 받아온 변수 초기화
            if let person = person {
                name = person.name
            }
        }
    }
}

struct ComposePersonView_Previews: PreviewProvider {
    static var previews: some View {
        ComposePersonView()
    }
}
