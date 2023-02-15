//
//  MemoListView.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct MemoListView: View {
    
    @ObservedObject var memoStore: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(memoStore.list) { memo in
                    NavigationLink {
                        DetailMemoView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Memmo")
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeMemoView() // 뷰 카드모달 형태로 띄어주기
            }
        }
        
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView(memoStore: MemoStore())
    }
}
