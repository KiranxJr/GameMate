//
//  AllSpaceView.swift
//  GameMate
//
//  Created by admin on 15/07/25.
//

import SwiftUI

struct SpaceNavView: View {
    var body: some View {
        
        
//        GeometryReader { geometry in
//            Image("spacebg")
//                .resizable()
//        }
//        .frame(height: UIScreen.main.bounds.width / 2)
//        .overlay {
//
//        }
        HStack{
            Image(systemName: "globe.europe.africa.fill")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 100,height: 100)
                .padding()
                
            VStack(alignment: .leading){
                Text("All Space")
                    .customFont(.medium, 26)
                    .foregroundStyle(.white)
                Text("Explore the world of Gaming")
                    .customFont(.regular, 14)
                    .foregroundStyle(.white)
            }
            
            
            Spacer()
            
        }
        .background(
            Rectangle()
                .fill(.black.opacity(0.2))
                .cornerRadius(12)
        )
        .onTapGesture {
            print("ontap")
        }
        
    }
}

#Preview {
    MainView()
}
