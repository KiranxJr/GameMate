//
//  Extensions.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI


var screenWidth = UIScreen.main.bounds.width
var screenHeight = UIScreen.main.bounds.height

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}


/// Offset Key
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minX)
                        .onPreferenceChange(OffsetKey.self, perform: completion)
                }
            }
    }
    
    @ViewBuilder
    func tabMask(_ tabProgress: CGFloat) -> some View {
        ZStack {
            self
                .foregroundStyle(.white)
            self
                .symbolVariant(.fill)
                .mask {
                    GeometryReader {
                        let size = $0.size
                        let capsuleWidth: CGFloat = size.width / CGFloat(ConnectTab.allCases.count)
                        
                            Capsule()
                            .frame(width: capsuleWidth)
                            .offset(x: tabProgress * (size.width - capsuleWidth))
                    }
                }
        }
    }
}

