//
//  AnimationLoadingButton.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct AnimatedLoadingButton: View {
    @State private var isLoading = false
    @Namespace private var animation

    var title: String = "Submit"
    var size: CGFloat = 200
    
    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                isLoading = true
            }

            // Simulate task completion
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                withAnimation {
                    isLoading = false
                }
                action()
            }
        }) {
            HStack(spacing: 10) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .matchedGeometryEffect(id: "loader", in: animation)
                } else {
                    Text(title)
                        .customFont(.semiBold,16)
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: "text", in: animation)
                }
            }
            .frame(width: isLoading ? 50 : size, height: 50)
            .background(.bgPurple)
            .cornerRadius(isLoading ? 25 : 12)
        }
        .disabled(isLoading)
        .animation(.easeInOut(duration: 0.3), value: isLoading)
    }
}

