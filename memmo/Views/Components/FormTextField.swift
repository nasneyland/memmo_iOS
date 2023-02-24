//
//  FormTextField.swift
//  memmo
//
//  Created by najin on 2023/02/22.
//

import SwiftUI

struct FormTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white)
            .cornerRadius(10)
    }
}
