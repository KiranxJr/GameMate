//
//  ContentView.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LoginView()
            
        }
        .background(.white)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
           
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    ContentView()
}
