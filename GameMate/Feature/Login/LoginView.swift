//
//  LoginView.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Login")
            VStack{
                FloatingPlaceholderTextField(placeholder: "Email")
                FloatingPlaceholderTextField(placeholder: "Password")
                AnimatedLoadingButton(title: "Save") {
                           print("Action completed")
                       }
            }
            Spacer()
        }
       
    }
}



#Preview {
    ContentView()
}
