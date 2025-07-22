//
//  HomeView.swift
//  GameMate
//
//  Created by admin on 14/07/25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack{
            VStack{
              
                ScrollView(showsIndicators: false) {
                    VStack{
                        
                        /// Game News View
                        GameNewsView()
                        
                        VStack (spacing: 15){
                            
                            /// Connect or Request
                            ConnectRequestView()
                            
                            /// All Space nav view
                            SpaceNavView()
                            
                            /// Game Knowlege View
                            GameKnowledgeView()
                            
                            /// Top Rated Games
                            TopRatedGamesView()
                        }
                     
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom,150)
                }
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.bgPurple)
        .ignoresSafeArea()
       
    }
}

#Preview {
    MainView()
}





