
//
//  Untitled.swift
//  GameMate
//
//  Created by admin on 07/07/25.
//



import SwiftUI

struct GameNewsView: View {
    @State var counts: [Int] = [1, 2, 3, 4, 5]
    @State private var currentIndex: Int = 1
    @State private var timerTask: DispatchWorkItem?
    @State private var isManualScroll = false

    var body: some View {
        VStack {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(counts, id: \.self) { index in
                                GeometryReader { itemGeo in
                                    let itemMidX = itemGeo.frame(in: .global).midX
                                    let screenMidX = UIScreen.main.bounds.width / 2
                                    let distance = abs(itemMidX - screenMidX)

                                    ZStack {
                                        Image("bg\(index)")
                                            .resizable()
                                            .scaledToFill()

                                            .cornerRadius(25)
                                            .clipped()

                                        Rectangle()
                                            .fill(.black.opacity(0.25).gradient)
                                            .cornerRadius(25)
                                    }
                                    .frame(width: screenWidth * 0.8, height: 200)
                                    .padding(.horizontal, screenWidth * 0.1)
                                    .background(
                                        Color.clear.preference(
                                            key: CenteredItemKey.self,
                                            value: [index: distance]
                                        )
                                    )
                                }
                                .frame(width: screenWidth,height: 200)
                                .id(index)
                            }
                        }
                        .onPreferenceChange(CenteredItemKey.self) { distances in
                            if let closest = distances.min(by: { $0.value < $1.value })?.key {
                                if closest != currentIndex {
                                    isManualScroll = true
                                    currentIndex = closest
                                }
                            }
                        }
                        .overlay(alignment: .bottom) {
                            PagingIndicator(activeTint: .white, inActiveTint: .white)
                              
                        }
                    }
                    .scrollTargetBehavior(.paging)
               
                    .onAppear {
                        startAutoScroll()
                    }
                    .onChange(of: currentIndex) { _, newValue in
                        if !isManualScroll {
                            withAnimation(.easeInOut) {
                                proxy.scrollTo(newValue, anchor: .center)
                            }
                        } else {
                            isManualScroll = false
                        }

                        startAutoScroll()
                    }
                }
            }    .frame(height: 220)
        }
    }

    // MARK: - Auto-scroll function
    private func startAutoScroll() {
        timerTask?.cancel()

        let task = DispatchWorkItem {
            withAnimation(.easeInOut(duration: 0.6)) {
                currentIndex = currentIndex >= counts.count ? 1 : currentIndex + 1
            }
        }

        timerTask = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: task)
    }
}

// MARK: - Center tracking key
struct CenteredItemKey: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}



#Preview {
    MainView()
}
