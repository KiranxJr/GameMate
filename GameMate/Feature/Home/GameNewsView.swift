//
//  GameNewsView.swift
//  GameMate
//
//  Created by admin on 14/07/25.
//

import SwiftUI

struct GameNewsView: View {
    @State var counts: [Int] = [1, 2, 3, 4, 5]
    @State var currentIndex: Int = 1

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(counts, id: \.self) { index in
                            ZStack {
                                Image("bg\(index)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .cornerRadius(25)
                                    .clipped()

                                Rectangle()
                                    .fill(.black.opacity(0.25).gradient)
                                    .cornerRadius(25)
                            }
                            .padding()
                            .frame(height: 200)
                            .containerRelativeFrame(.horizontal)
                            .id(index)
                        }
                    }
                    .overlay(alignment: .bottom) {
                        PagingIndicator(activeTint: .white, inActiveTint: .white)
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .frame(height: 220)
                .onChange(of: currentIndex) { oldValue, newValue in
                    
                    withAnimation(.easeInOut) {
                        proxy.scrollTo(newValue, anchor: .center)
                        changeScroll()
                    }
                }
                .onAppear {
                    // Trigger scroll after slight delay
                 changeScroll()
                }
            }
        }
      
    }
  private func changeScroll(){
       DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
           withAnimation(.easeInOut(duration: 0.6)) {
               if currentIndex > 5 {
                   currentIndex = 1
               } else {
                   currentIndex += 1
               }
           }
       }
   }
}


#Preview {
    MainView()
}
