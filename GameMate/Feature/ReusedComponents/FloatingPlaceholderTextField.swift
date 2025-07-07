//
//  FloatingPlaceholderTextField.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct FloatingPlaceholderTextField: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    @Namespace private var animation
    
    var placeholder: String
    
    var shouldFloat: Bool {
        isFocused || !text.isEmpty
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
         
            ZStack(alignment: .leading){
                TextField("" , text: $text)
                    .focused($isFocused)
                    .padding(.horizontal, 10)
                    .padding(.vertical,15)
                    .padding(.bottom, 4)
                  
                
                if !shouldFloat {
                    Text(placeholder)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .matchedGeometryEffect(id: "placeholder", in: animation)
                        .padding(.horizontal, 10)
                      
                        .transition(.scale)
                }
            }  .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Color.blue : Color.gray, lineWidth: 1)
            )
            if shouldFloat {
                Text(placeholder)
                    .font(.caption)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "placeholder", in: animation)
                    .padding(.horizontal, 10)
                    .background(.white)
                    .offset(y: -30)
                    .transition(.scale)
            }
            
        }
        .animation(.spring(duration: 0.3), value: shouldFloat)
      
       
        .padding()
    }
}

#Preview {
    LoginView()
}
