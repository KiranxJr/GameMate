//
//  AppBarView.swift
//  GameMate
//
//  Created by admin on 14/07/25.
//

import SwiftUI

struct AppBarView: View {
    var body: some View {
        HStack(alignment: .bottom,spacing: 30){
            
            HStack(alignment: .bottom){
                Image(systemName: "location.app")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 25,height: 25)
                
                Text("Ernakulam")
                    .customFont(.regular,16)
                    .foregroundStyle(.white)
                  
                Image(systemName: "chevron.down")
                    .foregroundStyle(.white)
                    .frame(width: 25,height: 25)
            }
            Spacer()
            Image(systemName: "ellipsis.message")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 25,height: 25)
          
            
            Image(systemName: "bell")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 25,height: 25)
        }
        .padding()
    }
}


#Preview {
    MainView()
}
