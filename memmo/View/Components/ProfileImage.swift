//
//  ProfileImage.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct ProfileImage: View {
    
    var width: CGFloat!
    var height: CGFloat!
    
    init(width: CGFloat = 50, height: CGFloat = 50) {
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image("profile")
            .resizable()
            .scaledToFill()
            .frame(width:width, height: height)
            .clipShape(Circle())
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
