//
//  GameGenreView.swift
//  GameMate
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct GameGenreView: View {
    
    var body: some View {
        VStack(){
            Text("Select Game Genre")
                .font(.title)
                .padding()
            GridIconView()
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity)
    }
}

struct GridIconView: View {
    // Sample system icon names
    let icons = ["house.fill", "gear", "bell.fill", "heart.fill", "star.fill", "message.fill"]
    @State var selectedItem : [String] = []
    // 3-column grid layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(icons.indices, id: \.self) { iconIndex in
                            VStack {
                                Image(systemName: icons[iconIndex])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(selectedItem.contains(icons[iconIndex]) ? Color.blue.opacity(0.5): Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                                
                                Text(icons[iconIndex].capitalized)
                                    .font(.caption)
                            } .onTapGesture {
                                if let index = selectedItem.firstIndex(of: icons[iconIndex]) {
                                    selectedItem.remove(at: index)
                                } else {
                                    selectedItem.append(icons[iconIndex])
                                }
                            }
                        }
                    }
                    .padding()
                    
                }
            }
            Button(action: {
                print("Button tapped")
            })  {
                    Text("Next")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame( height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                
            }
           
        }
    }
}

#Preview {
    GameGenreView()
}
