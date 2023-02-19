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
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("카테고리를 입력해주세요.", text: $name)
                
                Button {
                    viewModel.addCategory(name: name)
                    dismiss()
                } label: {
                    Text("생성하기")
                }
            }
        }
    }
}

struct ComposeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeCategoryView()
    }
}
