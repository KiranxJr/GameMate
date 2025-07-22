////
////  ConnectDetailView.swift
////  GameMate
////
////  Created by admin on 21/07/25.
////
//
//import SwiftUI
//
//struct ConnectDetailView: View {
//    var mainPageAnimation: Namespace.ID
//    var imageAnimation: Namespace.ID
//    @Binding var showDetailPage: Bool
//    var index: Int
//
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            // Background for animation
//            RoundedRectangle(cornerRadius: 12)
//                .fill(Color.bgPurple)
//                .matchedGeometryEffect(id: "controllerBackground\(index)", in: imageAnimation)
//                .ignoresSafeArea()
//
//            VStack(spacing: 0) {
//                // Top image with profile overlay
//                ZStack(alignment: .bottom) {
//                    Image("d2")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: screenWidth, height: screenHeight / 2.5)
//                        .clipped()
//                        .cornerRadius(12)
//
//                    // Profile overlay
//                    HStack(spacing: 12) {
//                        RoundedRectangle(cornerRadius: 12)
//                            .foregroundStyle(.white)
//                            .frame(width: 80, height: 80)
//
//                        VStack{
//                            Spacer()
//                            Text("Brad Pitt")
//                                .foregroundStyle(.white)
//                                .customFont(.medium, 24)
//                        }
//
//                        Spacer()
//                    }
//                    .frame( height: 80)
//                    .padding(.horizontal)
//                    .padding(.bottom, -35)
//                }
//                .frame(width: screenWidth, height: screenHeight / 2.5)
//
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .ignoresSafeArea()
//
//            // Back button
//            HStack {
//                Image(systemName: "arrow.backward.square.fill")
//                    .resizable()
//                    .frame(width: 45, height: 45)
//                    .foregroundColor(.white)
//                    .onTapGesture {
//                        withAnimation(.spring(response: 0.45, dampingFraction: 0.85)) {
//                            showDetailPage = false
//                        }
//                    }
//                Spacer()
//            }
//            .padding()
//
//            // Bottom Detail Section
//            VStack {
//                Spacer()
//                VStack(alignment: .leading) {
//                    // Add additional player info or details here
//                }
//                .frame(maxWidth: .infinity)
//                .frame(height: screenHeight / 2)
//                .background(Color.bgPrimary.cornerRadius(12))
//                .padding(.horizontal)
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
//
//#Preview {
//    @Previewable @Namespace var previewNamespace
//    @Previewable @Namespace var previewNamespace2
//    //    ConnectDetailView(
//    //        mainPageAnimation: previewNamespace,
//    //        imageAnimation: previewNamespace2,
//    //        showDetailPage: .constant(false),
//    //        index: 0
//    //    )
//ConnectView()
//}
//
