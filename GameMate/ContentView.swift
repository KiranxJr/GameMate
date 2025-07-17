//
//  ContentView.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct ContentView: View {
    @State var isLoading: Bool = true
    @State var showLogin: Bool = false
    @Namespace private var loginAnimation
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.white.ignoresSafeArea()
            
            Rectangle()
                .fill(isLoading ? .bgPurple : .bgPrimary)
                .frame(height: UIScreen.main.bounds.height )
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
                .zIndex(0)
            
            
            if !isLoading {
                /// Background Image View
                BgView()
                
                /// Contains text and navigation buttons
                DescriptionView()
                
            }
            
            // Animated icon that scales and fades out
            VStack {
                Image(systemName: "gamecontroller.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundStyle(.white)
                    .scaleEffect(isLoading ? 1 : 70)      // Scale up when loading ends
                    .opacity(isLoading ? 1 : 0)          // Fade out
                    .animation(.easeInOut(duration: 0.6), value: isLoading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .zIndex(2)
            
            if showLogin {
                LoginView(animation: loginAnimation)
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isLoading = false
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    @ViewBuilder
    private func BgView() -> some View{
        VStack (){
            Image("bg\(Int.random(in: 1...6))")
                .resizable()
                .scaledToFill()
                .frame(width:  UIScreen.main.bounds.width,height:  UIScreen.main.bounds.height/1.5 )
                .animation(.easeInOut(duration: 2), value: isLoading)
        }
        .overlay(content: {
            Rectangle()
                .fill(.black)
                .opacity(0.4)
        })
        .mask(
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black, Color.black,
                                                       Color.black.opacity(0.2), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
        )
        
        
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func DescriptionView() -> some View{
        VStack(spacing: 25) {
            Spacer()
            Spacer()
            Text("SQUAD UP.\nGAME TOGETHER.\nLEVEL UP.")
                .customFont(.black,40)
                .foregroundStyle(.white)
            
            
            
            Text("Find your gaming crew. Chat, squad up, and Dominate.")
                .customFont(.medium
                            ,16)
                .foregroundStyle(.white)
            Spacer()
            AnimatedLoadingButton(title: "Login",size: 300,action: {
                withAnimation {
                    showLogin = true
                }
            })
            .matchedGeometryEffect(id: "Login", in: loginAnimation)
            AnimatedLoadingButton(title: "Sign up",size: 300,action: {
                withAnimation {
                    showLogin = true
                }
            })
            Spacer()
        }
        .padding(.bottom,60)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
