//
//  Extensions.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
