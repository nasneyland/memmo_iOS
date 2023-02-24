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
    var image: UIImage?
    
    init(width: CGFloat = 50, height: CGFloat = 50, image: UIImage = UIImage(named: "profile")!) {
        self.width = width
        self.height = height
        self.image = image
    }
    
    var body: some View {
        
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width:width, height: height)
                .clipShape(Circle())
        } else {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width:width, height: height)
                .clipShape(Circle())
        }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
