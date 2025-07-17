//
//  ConnectRequestView.swift
//  GameMate
//
//  Created by admin on 14/07/25.
//

import SwiftUI


struct ConnectRequestView: View {
    var body: some View {
        HStack(){
            
            VStack (){
                Image("bg3")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width / 2.3)
            }
            .overlay {
                VStack{
                    Spacer()
                    ZStack{
                        Rectangle()
                            .fill(.black)
                            .cornerRadius(12)
                            .opacity(0.6)
                        
                        Text("Connect")
                            .customFont(.medium, 21)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(height: 50,alignment: .bottom)
                }
                
            }
            .cornerRadius(12)
            .frame(width: UIScreen.main.bounds.width / 2.3)
            
            Spacer()
            
            VStack (){
                Image("bg4")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width / 2.3)
            }
            .overlay {
                VStack{
                    Spacer()
                    ZStack{
                        Rectangle()
                            .fill(.black)
                            .cornerRadius(12)
                            .opacity(0.6)
                        
                        Text("Request")
                            .customFont(.medium, 21)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(height: 50,alignment: .bottom)
                }
                
            }
            .cornerRadius(12)
            .frame(width: UIScreen.main.bounds.width / 2.3)
        }
    }
}


#Preview {
    MainView()
}
