//
//  DetailMemoView.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct DetailMemoView: View {
    
    @ObservedObject var memo: Memo
    
    var body: some View {
        Text("프로필 상세보기")
    }
}

struct DetailMemoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMemoView(memo: Memo(emoji: "⭐", content: "test", person: Person(name: "test")))
    }
}
