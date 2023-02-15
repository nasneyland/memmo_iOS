//
//  ProfileImage.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
        Image("profile")
            .resizable()
            .scaledToFill()
            .frame(width:50, height: 50)
            .clipShape(Circle())
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
