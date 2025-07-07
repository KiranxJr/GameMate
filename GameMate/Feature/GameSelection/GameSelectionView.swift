//
//  GameSelectionView.swift
//  GameMate
//
//  Created by admin on 19/06/25.
//

import SwiftUI

struct GameSelectionView: View {
    
    var body: some View {
        VStack(){
            Text("Select Games")
                .font(.title)
                .padding()
            ImageGridView()
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity)
    }
}

struct ImageGridView: View {
    // Sample system icon names
    let icons = ["house.fill", "gear", "bell.fill", "heart.fill", "star.fill", "message.fill"]
    @State var selectedItem : [String] = []
    // 3-column grid layout
    let columns = [
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
                                Rectangle()
                                    .frame(width: 100, height: 100)
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
    GameSelectionView()
}
