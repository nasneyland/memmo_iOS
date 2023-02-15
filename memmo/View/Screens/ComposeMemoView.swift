//
//  ComposeMemoView.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct ComposeMemoView: View {
    
    @State private var personImage = UIImage()
    
    var body: some View {
        Text("멤모 추가하기")
    }
}

struct ComposeMemoView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeMemoView()
    }
}
