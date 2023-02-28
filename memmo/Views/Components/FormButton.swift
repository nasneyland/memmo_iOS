//
//  FormButton.swift
//  memmo
//
//  Created by najin on 2023/02/22.
//

import SwiftUI

struct FormButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(.white)
            .cornerRadius(10)
    }
}
