//
//  TopRatedGamesView.swift
//  GameMate
//
//  Created by admin on 14/07/25.
//

import SwiftUI

struct TopRatedGamesView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            Text("Top Rated games of this Week")
                .customFont(.medium, 18)
                .foregroundStyle(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<10, id: \.self) { index in
                        ZStack {
                            VStack{
                                Spacer()
                                HStack{
                                    if index == 9 {
                                        ZStack{
                                            HStack{
                                                Spacer()
                                                Text("0")
                                                    .foregroundStyle(.white)
                                                    .customFont(.rampartOne, 100)
                                            }
                                            HStack{
                                                Text("1")
                                                    .foregroundStyle(.white.gradient)
                                                    .customFont(.rampartOne, 100)
                                                Spacer()
                                            }
                                        }
                                        .frame(width: 100)
                                    } else {
                                        Text("\(index+1)")
                                            .foregroundStyle(.white.gradient)
                                            .customFont(.rampartOne, 100)
                                        
                                    }
                                    
                                    Spacer()
                                }
                            }
                            VStack{
                                Spacer()
                                HStack{
                                    Spacer()
                                    Image("bg4")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 190,alignment: .trailing)
                                        .cornerRadius(12)
                                        .overlay {
                                            Text("Fortnite")
                                                .foregroundColor(.white)
                                                .customFont(.regular, 21)
                                                .background(
                                                    Rectangle()
                                                        .fill(Color.black.opacity(0.6).gradient)
                                                        .frame(width: 150)
                                                        .cornerRadius(12)
                                                )
                                                .frame( height: 190,alignment: .bottomLeading)
                                                .frame(maxWidth: .infinity)
                                              
                                               
                                        }
                                }
                                
                            }
                            
                            
                        }
                        .frame(width: index == 9 ? 220 : 200, height: 200)
                        
                    }
                }
                //                            .padding(.horizontal)
            }
        }
    }
}


#Preview {
    MainView()
}
