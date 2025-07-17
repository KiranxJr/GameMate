//
//  TabItem.swift
//  GameMate
//
//  Created by admin on 10/07/25.
//

import SwiftUI

/// Tab Bar Item
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: TabModel
    var animation: Namespace.ID
    @Binding var activeTab: TabModel
    @Binding var position: CGPoint
    @State private var tabPosition: CGPoint = .zero

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundStyle(activeTab == tab ? .white : inactiveTint)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ActiveTab", in: animation)
                    }
                }

            Text(tab.rawValue)
                .customFont(.regular,14)
                .foregroundStyle(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition { rect in
            tabPosition.x = rect.midX
            if activeTab == tab {
                position.x = rect.midX
            }
        }
        .onTapGesture {
            activeTab = tab
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}


#Preview {
    MainView()
}
