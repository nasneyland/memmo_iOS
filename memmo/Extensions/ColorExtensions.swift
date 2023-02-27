//
//  ColorExtensions.swift
//  memmo
//
//  Created by najin on 2023/02/15.
//

import Foundation
import SwiftUI

extension Color {
    
    // hex 코드를 이용한 색상코드 설정
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    // 색상 팔레트
    static let light_red = Color(hex: "FF9696")
    static let dark_red = Color(hex: "E77070")
    static let light_orange = Color(hex: "FBBD79")
    static let dark_orange = Color(hex: "F79A74")
    static let light_yellow = Color(hex: "FDE584")
    static let dark_yellow = Color(hex: "F9D257")
    static let light_green = Color(hex: "93E95B")
    static let dark_green = Color(hex: "49C552")
    static let light_blue = Color(hex: "7ABBED")
    static let dark_blue = Color(hex: "4995C5")
    static let light_purple = Color(hex: "B3A9EB")
    static let dark_purple = Color(hex: "846ADC")
    static let light_gray = Color(hex: "C9C9C9")
    static let dark_gray = Color(hex: "A1A1A1")
    
    static let system_gray = Color(hex: "F3F4FA")
}
