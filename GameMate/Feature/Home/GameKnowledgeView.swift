//
//  GameKnowledgeView.swift
//  GameMate
//
//  Created by admin on 14/07/25.
//

import SwiftUI

struct GameKnowledgeView: View {
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "brain.head.profile")
                .resizable()
                .frame(width: 35,height: 40)
          
            
            VStack(alignment: .leading){
                Text("Game Quiz")
                    .customFont(.regular, 18)
                    .foregroundStyle(.black)
                Text("Test your Game Knowledge")
                    .customFont(.regular, 14)
                    .foregroundStyle(.black)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 10,height: 20)
            
        }
        .padding()
        .padding(.leading)
        .frame(maxWidth: .infinity)
        
        .background(
            Rectangle()
                .fill(.bgPrimary)
                .cornerRadius(12)
        )
    }
}


#Preview {
    MainView()
}
