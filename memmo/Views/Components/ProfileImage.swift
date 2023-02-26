//
//  ProfileImage.swift
//  memmo
//
//  Created by najin on 2023/02/12.
//

import SwiftUI

struct ProfileImage: View {
    
    var size: CGFloat?
    var image: UIImage?
    
    init(size: CGFloat = 50, image: UIImage = UIImage(named: "profile")!) {
        self.size = size
        self.image = image
    }
    
    var body: some View {
        
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width:size, height: size)
                .clipShape(Circle())
        } else {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width:size, height: size)
                .clipShape(Circle())
        }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
