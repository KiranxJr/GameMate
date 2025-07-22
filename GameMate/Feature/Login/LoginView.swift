//
//  LoginView.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct LoginView: View {
    var animation: Namespace.ID

    var body: some View {
        VStack{
            ZStack(alignment: .top) {
               
                VStack{
                    Rectangle()
                        .fill(.bgPurple)
                       
                        .frame(height: UIScreen.main.bounds.height / 2 ,alignment: .top)
                        .frame(maxWidth: .infinity,alignment: .top)
                  
                
                .overlay(content: {
                    VStack (spacing: 0){
                        Spacer()
                        HStack{
                            Image("Mate")
                                .resizable()
                                .scaledToFit()
                                .frame( height: UIScreen.main.bounds.width / 2)
                            Spacer()
                        }
                        .padding(.leading,20)
                        GeometryReader { geo in
                                 Text("Gamet")
                                .customFont(.bold, UIScreen.main.bounds.width / 5)
                                .foregroundStyle(.white)
                                     .fixedSize()
                                     .position(x: geo.size.width / 2, y: geo.size.height / 2)
                             }
                             .frame(height: 60)
                             .padding(.bottom)
                    }
                    .padding(.bottom,20)
                })
               
                .matchedGeometryEffect(id: "Login", in: animation)
                    Spacer()
                }
                .ignoresSafeArea()
                    VStack(spacing: 16) {

                            HStack{
                                Text("Login")
                                    .customFont(.bold, 26)
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                            
                            FloatingPlaceholderTextField(placeholder: "Email")
                      
                        FloatingPlaceholderTextField(placeholder: "Password")
                        HStack{
                            Toggle(isOn: .constant(true)) {
                                 
                                }
                            .labelsHidden()
                            .tint(.bgPurple)
                            .scaleEffect(0.8)
                                                          Text("Remember me")
                                .customFont(.regular,12)
                            Spacer()
                            Text("Forgot password?")
                                .customFont(.regular,12)
                        }
                        AnimatedLoadingButton(title: "Login") {
                            print("Action completed")
                        }
                        Text("New Here? Sign up")
                            .customFont(.regular,12)
                        
                    }
                    .padding(24)
                    
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.top, UIScreen.main.bounds.width)
                    Spacer()
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
         Text("All rights Reserved © 2021")
                .customFont(.regular,10)
                .foregroundStyle(.black.opacity(0.7))
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgPrimary)
        
   
    }
}

#Preview {
    @Previewable @Namespace var previewNamespace
//    LoginView(animation: previewNamespace)
    ContentView()
}
