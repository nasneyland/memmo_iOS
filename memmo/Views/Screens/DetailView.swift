//
//  DetailView.swift
//  memmo
//
//  Created by najin on 2023/02/26.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var viewModel: MemoViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var showMemoComposer: Bool = false
    
    @Binding var category: Category?
    @Binding var person: Person?
    
    var body: some View {
        VStack(spacing: 10) {
            Text(" ")
                .font(.caption)
                .navigationBarTitle(Text(""))
                .navigationBarItems(trailing: Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .foregroundColor(.black)
            
            ProfileImage(size: 100)
            Text(category?.name ?? "")
                .font(.system(size: 10))
                .fontWeight(.medium)
                .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                .background(Color("light_\(category?.color ?? "gray")"))
                .cornerRadius(8)
            Text(person?.name ?? "")
                .font(.body)
            HStack() {
                Spacer()
                Button() {
                    showMemoComposer = true
                } label: {
                    Label("메모 추가하기", systemImage: "plus")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
            }
            VStack() {
                List() {
                    if let memos = person?.memos {
                        ForEach(memos) { memo in
                            Section(header: Text("\(memo.type?.emoji ?? "") \(memo.type?.title ?? "")")) {
                                Text("\(memo.content)")
                                    .font(.system(size: 13))
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
        .sheet(isPresented: $showMemoComposer) {
            ComposeMemoView(person: $person)
        }
    }
}
