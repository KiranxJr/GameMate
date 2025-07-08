//
//  FontWeight.swift
//  Sanktion
//
//  Created by Vishnu Nair on 11/11/24.
//


import SwiftUI

enum FontWeight {
    case light
    case regular
    case medium
    case semiBold
    case bold
    case black
}

extension Font {
    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .light:
            Font.custom("Poppins-Light", size: size)
        case .regular:
            Font.custom("Poppins-Regular", size: size)
        case .medium:
            Font.custom("Poppins-Medium", size: size)
        case .semiBold:
            Font.custom("Poppins-SemiBold", size: size)
        case .bold:
            Font.custom("Poppins-Bold", size: size)
        case .black:
            Font.custom("Poppins-Black", size: size)
        }
    }
}

extension Text {
    func customFont(_ fontWeight: FontWeight? = .regular, _ size: CGFloat? = nil) -> Text {
        return self.font(.customFont(fontWeight ?? .regular, size ?? 16))
    }
}
