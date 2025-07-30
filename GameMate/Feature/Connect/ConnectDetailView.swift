
//  ConnectDetailView.swift
//  GameMate
//
//  Created by admin on 21/07/25.
//

import SwiftUI

struct ConnectDetailView: View {
    var mainPageAnimation: Namespace.ID
    var imageAnimation: Namespace.ID
    @Binding var showDetailPage: Bool
    var index: Int
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background for animation
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.bgPrimary)
                .matchedGeometryEffect(id: "controllerBackground\(index)", in: imageAnimation)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top image with profile overlay
                ZStack(alignment: .bottom) {
                    Image("d2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: screenWidth, height: screenHeight / 2.5)
                        .clipped()
                        .cornerRadius(20)
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color.black,
                                                                       Color.black.opacity(0.2), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                            .cornerRadius(20)
                        )
                    // Profile overlay
                    HStack(alignment: .bottom,spacing: 12) {
                        Image("spacebg")
                            .resizable()
                            .scaledToFill()
                        
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(12)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                          .stroke(Color.white, lineWidth: 2)
                            }
                        
                        VStack{
                            Spacer()
                            Text("Brad Pitt")
                                .foregroundStyle(.white)
                                .customFont(.medium, 24)
                        }
                        
                        Spacer()
                    }
                    .frame( height: 80)
                    .padding(.horizontal)
                    .padding(.bottom,5)
                   
                    
                }
                .frame(width: screenWidth, height: screenHeight / 2.5)
                
                
                VStack (spacing: 20){
                 
                  
                    ScrollView {
                        VStack (spacing: 15){
                            VStack(alignment: .leading,spacing: 0){
                                Text("Platform")
                                    .customFont(.medium, 18)
                                HStack(spacing: 20){
                                    Spacer()
                                    Image(systemName: "playstation.logo")
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background(Color.bgPurple.cornerRadius(5))
                                    Image(systemName: "desktopcomputer")
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background(Color.bgPurple.cornerRadius(5))
                                    Image(systemName: "xbox.logo")
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background(Color.bgPurple.cornerRadius(5))
                                    Image(systemName: "iphone.gen1")
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background(Color.bgPurple.cornerRadius(5))
                                    Spacer()
                                }
                            }
                                    
                                  
                            VStack(alignment: .center,spacing: 5){
                                HStack{
                                    Text("Required Players:")
                                        .customFont(.regular,14)
                                    Spacer()
                                    Text("1/5")
                                        .customFont(.regular,14)
                                }
                                ProgressView(value: 1, total: 5)
                                    .progressViewStyle(LinearProgressViewStyle(tint: .bgPurple))
                                    .scaleEffect(x: 1, y: 2, anchor: .center)
                                
                            }
                            .padding()
//                            .background(BlurView(style: .systemUltraThinMaterial).cornerRadius(5))
                            .background(Color.white.opacity(0.4).cornerRadius(5))
                            LazyVGrid(columns: columns, spacing: 20) {
                                playerDetail("bolt.fill", "Skill", "Any",Color.yellow)
                                playerDetail("figure.archery", "Playstyle", "Competitive",Color.green)
                                playerDetail("microphone.fill", "Audio", "No Mic",Color.red)
                                playerDetail("sun.max.fill", "Timing", "Night",Color.orange)
                            }

                             
                                
                            VStack(alignment: .leading){
                                HStack {
                                    Image(systemName: "bubble.right.fill")
                                        .foregroundStyle(.black)
                                    Text("Notes")
                                        .customFont(.medium, 18)
                                    Spacer()
                                }
                               
                                Text("Looking for players to join me in a night game")
                                    .customFont(.regular, 16)
                            }
                            
                        }
                        .padding(.top)
                        .padding(.bottom,100)
                        .padding(.horizontal)
                    }
                }
//                .padding(.top,35)
             
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 15, height: 15)
                        Text("Cancel")
                            .customFont(.medium, 16)
                            .foregroundStyle(.red)
                    }
                    .padding()
                    .frame(width: screenWidth / 2.5)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.bgPrimary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.red, lineWidth: 2)
                            )
                        
                    )
                    Spacer()
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "gamecontroller.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 25, height: 20)
                        Text("Connect")
                            .customFont(.medium, 16)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(width: screenWidth / 2.5)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.bgPurple)
                        
                    )
                    
                }
            }
            .padding(.horizontal)
           
            
            // Back button
            HStack {
                Image(systemName: "chevron.backward.circle.fill")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.85)) {
                            showDetailPage = false
                        }
                    }
                Spacer()
            }
            .padding(.horizontal)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func playerDetail(_ image: String,_ fieldName: String, _ value: String,_ color : Color) -> some View{
        HStack(alignment: .center){
         
                
                Image(systemName: image)
                .foregroundStyle(.white)
                    .padding()
                    .frame(width: 60, height: 60)
                    .background(color.cornerRadius(5))
            
                    
            VStack(alignment: .leading){
                Text("\(fieldName)")
                    .foregroundStyle(.white)
                    .customFont(.medium, 16)
            
            Text(value)
                .foregroundStyle(.white)
                .customFont(.regular, 14)
            }
            Spacer()
         
        }
        
            .frame(width: screenWidth / 2.2)
            .background(Color.bgPurple.cornerRadius(5))
    }
    
}




#Preview {
    @Previewable @Namespace var previewNamespace
    @Previewable @Namespace var previewNamespace2
    ConnectDetailView(
        mainPageAnimation: previewNamespace,
        imageAnimation: previewNamespace2,
        showDetailPage: .constant(false),
        index: 0
    )
    //ConnectView()
}

