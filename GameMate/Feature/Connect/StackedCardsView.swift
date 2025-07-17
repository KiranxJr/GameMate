//
//  StackedCardsView.swift
//  GameMate
//
//  Created by admin on 17/07/25.
//

import SwiftUI

struct StackedCardsView: View {
    @State private var showIndicator : Bool = false
    var colors: [Color] = [.red,.yellow,.green,.blue]
    var width: CGFloat = 150
    var height: CGFloat = 400
   var scrollLocked: Bool = false
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                
                ScrollView(.horizontal){
                    HStack(spacing: 0){
                        ForEach(colors,id: \.self) { color in
                        RoundedRectangle(cornerRadius: 12)
                                .fill(color.gradient)
                                .padding(.trailing,65)
                                .frame(width: size.width)
                                .visualEffect { content, geometryProxy in
                               
                                    return content
                                        .scaleEffect(scale(geometryProxy, scale: 0.1),anchor: .trailing)
                                    
                                        .rotationEffect(rotation(geometryProxy,rotation: 5))
                                        .offset(x: minX(geometryProxy))
                                        .offset(x: excessMinX(geometryProxy))
                                }
                                .zIndex(colors.zIndex(color))
                        }
                    }
//                    .padding(.vertical,15)
                }
                .scrollDisabled(scrollLocked)
                .scrollTargetBehavior(.paging)
                .scrollIndicators(showIndicator ? .visible : .hidden)
                    
            }
            .frame(width: width,height: height)
           
        }
    }
    // Stacked Animation
    nonisolated func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }
    nonisolated func progress(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat {
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let progress = (maxX / width) - 1.0
        let cappedProgress = min(progress, limit)
        return cappedProgress
    }
    
    nonisolated func scale(_ proxy: GeometryProxy, scale: CGFloat = 0.1) -> CGFloat {
        let progress = progress(proxy)
        return 1 - (progress * scale)
    }
    
    nonisolated func excessMinX(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
        let progress = progress(proxy)
        
        return progress * offset
    }
    nonisolated func rotation(_ proxy: GeometryProxy, rotation: CGFloat = 10) -> Angle {
        let progress = progress(proxy)
        
        return .init(degrees: progress * rotation)
    }
}


extension [Color] {
    func zIndex(_ item: Color) -> CGFloat {
        if let index = firstIndex(where: { $0 == item }) {
            return CGFloat(count) - CGFloat(index)
        }
        
        return .zero
    }
}

#Preview {
    ConnectView()
}
