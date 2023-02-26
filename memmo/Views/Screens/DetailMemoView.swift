//
//  DetailMemoView.swift
//  memmo
//
//  Created by najin on 2023/02/26.
//

import SwiftUI

struct DetailMemoView: View {
    
    @Binding var category: Category?
    @Binding var person: Person?
    
    var body: some View {
        VStack(spacing: 10) {
            ProfileImage(size: 100)
            Text(category?.name ?? "")
                .font(.system(size: 10))
                .fontWeight(.medium)
                .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                .background(Color("light_\(category?.color ?? "gray")"))
                .cornerRadius(8)
            Text(person?.name ?? "")
                .font(.body)
//            HStack() {
//                Text("🧃")
//                    .overlay {
//
//                    }
//            }
            Spacer()
        }
        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
    }
}
