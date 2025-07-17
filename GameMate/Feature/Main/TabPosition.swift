//
//  TabPosition.swift
//  GameMate
//
//  Created by admin on 11/07/25.
//

import SwiftUI

/// Custom View Extension
struct Positionkey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    
                    Color.clear
                        .preference(key: Positionkey.self, value: rect)
                        .onPreferenceChange(Positionkey.self,perform: completion)
                }
            }
    }
}
