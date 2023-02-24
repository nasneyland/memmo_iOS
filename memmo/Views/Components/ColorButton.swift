//
//  ColorButton.swift
//  memmo
//
//  Created by najin on 2023/02/19.
//

import SwiftUI

struct ColorButton: ButtonStyle {
    
    @Environment(\.isEnabled) private var unSelected: Bool
    
    var backgroundColor = "gray"

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 30, height: 30)
            .background(Capsule().fill(Color("light_\(backgroundColor)")))
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: unSelected ? 0 : 2))
    }
}
