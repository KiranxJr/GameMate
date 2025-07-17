//
//  HomeView.swift
//  GameMate
//
//  Created by admin on 10/07/25.
//

import SwiftUI

struct MainView: View {
    ///View Properties
    @State private var activeTab: TabModel = .home
    @Namespace private var animation
    @State private var tabShapePosition : CGPoint = .zero
    var body: some View {
        VStack(spacing: 0){
            TabView (selection: $activeTab){
                Text("Home")
                    .tag(TabModel.home)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
                Text("Connect")
                    .tag(TabModel.connect)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
                Text("Request")
                    .tag(TabModel.request)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
                Text("Profile")
                    .tag(TabModel.profile)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
              
            }
            customTabBar()
        }.onAppear {
            GameStore.shared.fetchGames { result in
                switch result {
                case .success(let games):
                    print("Fetched \(games.count) games")
                    games.forEach { print($0.name) }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    /// Custom Tab Bar
    @ViewBuilder
    func customTabBar(_ tint: Color = .bgPurple, _ inactiveTint: Color = .bgPurple) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                TabItem(tint: tint, inactiveTint: inactiveTint, tab: tab, animation: animation, activeTab: $activeTab, position: $tabShapePosition)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background {
            TabShape(midPoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }

 
}

#Preview {
    MainView()
}
