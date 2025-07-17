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
        ZStack(){
            TabView (selection: $activeTab){
                HomeView()
                    .tag(TabModel.home)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
                Text("Connect")
                    .tag(TabModel.connect)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
                Text("AllSpace")
                    .tag(TabModel.allSpace)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
                Text("Profile")
                    .tag(TabModel.profile)
                ///Hiding Native Tab Bar
                    .toolbar(.hidden,for: .tabBar)
                
              
            }
         
            VStack{
                Spacer()
                customTabBar()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
     
        .onAppear {
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
    func customTabBar(_ tint: Color = .white, _ inactiveTint: Color = .bgPurple) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                TabItem(tint: tint, inactiveTint: inactiveTint, tab: tab, animation: animation, activeTab: $activeTab, position: $tabShapePosition)
              
            }
        }
        .padding(.horizontal, 15)        .background {
            TabShape(midPoint: tabShapePosition.x)
                .fill(.bgPrimary.opacity(0.94).gradient)
                .ignoresSafeArea()
             
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }

 
}

#Preview {
    MainView()
}
