//
//  PageIndicatorView.swift
//  GameMate
//
//  Created by admin on 15/07/25.
//

import SwiftUI

struct PagingIndicator: View {
    var activeTint: Color = .gray
    var inActiveTint : Color = .gray
    var body: some View {
        GeometryReader {
            let width = $0.size.width
            if let scrollViewWidth = $0.bounds(of: .scrollView(axis: .horizontal))?.width,
               scrollViewWidth > 0 {
                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                let totalPages = Int(width / scrollViewWidth)
                /// Progress
                let freeProgress = -minX / scrollViewWidth
                let clippedProgress = min(max(freeProgress, 0.0), 1.0)
                let progress = freeProgress
                
                /// Indexes
                let activeIndex = Int(progress)
                let nextIndex = Int(progress.rounded(.awayFromZero))
                let indicatorProgress = progress - CGFloat(activeIndex)
                /// Indicator widths
                let currentPageWidth = 18 - (indicatorProgress * 18)
                let nextPageWidth = indicatorProgress * 18

                HStack(spacing: 10) {
                    ForEach(0..<totalPages, id: \.self){ index in
                    Capsule()
                            .fill(inActiveTint)
                            .frame(width: 8 + (activeIndex == index ? currentPageWidth : nextIndex == index ? nextPageWidth : 0),height: 8)
                            .overlay {
                                ZStack {
                                    Capsule()
                                        .fill(inActiveTint)
                                    Capsule()
                                        .fill(activeTint)
                                        .opacity(activeIndex == index ?  1 - indicatorProgress : nextIndex == index ? indicatorProgress : 0)
                                }
                            }
                    }
                }
                .frame(width: scrollViewWidth)
                .offset(x: -minX)
            }
        }
        .frame(height: 30)
    }
}


