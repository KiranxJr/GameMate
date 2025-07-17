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
    case thin
    case extraLight
    case extraBold
    case bungee
    case bungeSpice
    case rampartOne
}

extension Font {
    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .light:
            Font.custom("Prompt-Light", size: size)
        case .regular:
            Font.custom("Prompt-Regular", size: size)
        case .medium:
            Font.custom("Prompt-Medium", size: size)
        case .semiBold:
            Font.custom("Prompt-SemiBold", size: size)
        case .bold:
            Font.custom("Prompt-Bold", size: size)
        case .extraBold:
            Font.custom("Prompt-ExtraBold", size: size)
        case .extraLight:
            Font.custom("Prompt-ExtraLight", size: size)
        case .thin:
            Font.custom("Prompt-Thin", size: size)
        case .black:
            Font.custom("Prompt-Black", size: size)
        case .bungee:
            Font.custom("BungeeShade-Regular", size: size)
        case .bungeSpice:
            Font.custom("BungeeSpice-Regular",size: size)
        case .rampartOne:
            Font.custom("RampartOne-Regular",size: size)
        }
    }
}

extension Text {
    func customFont(_ fontWeight: FontWeight? = .regular, _ size: CGFloat? = nil) -> Text {
        return self.font(.customFont(fontWeight ?? .regular, size ?? 16))
    }
}
