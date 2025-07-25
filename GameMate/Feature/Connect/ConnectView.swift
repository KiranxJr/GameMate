//
//  ConnectView.swift
//  GameMate
//
//  Created by admin on 16/07/25.
//

import SwiftUI

struct ConnectView: View {
    @State private var statusBarTab: ConnectTab = .connect
    @State private var selectedTab: ConnectTab?
    @Environment(\.colorScheme) private var scheme
    @State private var tabProgress: CGFloat = 0
    @Namespace private var mainPageAnimation
    @Namespace private var imageAnimation
    @State private var showDetailPage: Bool = false
    @State var selectedIndex : Int = 0

    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack{
                    Spacer()
                    Text("All")
                    Spacer()
                }
                .padding(.bottom)
                .frame(width: screenWidth / 4,height:  screenWidth / 3)
                .background(
                    Color.bgPrimary
                        .cornerRadius(12)
                )
                StackedCardsView(width: screenWidth / 2.5,height: screenWidth / 3,scrollLocked: true)

                VStack{
                    Image(systemName: "plus.app")
                }
                .frame(width:  screenWidth / 6,height:  screenWidth / 6)
                .background(
                    Color.white
                        .cornerRadius(12)
                )

            }
            .frame(height:  screenWidth / 2.5)
            CustomTabBarView()

            TabListView()

            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.bgPurple)
        .overlay(content: {
            if showDetailPage {
                /// Detail Page for Connect
                ConnectDetailView(mainPageAnimation: mainPageAnimation, imageAnimation: imageAnimation, showDetailPage: $showDetailPage, index: selectedIndex)
                    .transition(.asymmetric(insertion: .identity, removal: .opacity))
            }
        })
    }

    @ViewBuilder
    func TabListView() -> some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let horizontalPadding: CGFloat = 12
            let itemWidth = screenWidth - (horizontalPadding * 2)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {

                    ConnectListItem()
                        .frame(width: itemWidth)
                        .background(Color.white.opacity(0.2).cornerRadius(12))
                        .padding(.horizontal, horizontalPadding)
                        .id(ConnectTab.connect)

                    RequestListItem()
                        .frame(width: itemWidth)
                        .background(Color.white.opacity(0.2).cornerRadius(12))
                        .padding(.horizontal, horizontalPadding)
                        .id(ConnectTab.request)

                }
                .scrollTargetLayout()
                .offsetX { value in
                    let progress = -value / (screenWidth * CGFloat(ConnectTab.allCases.count - 1))
                    tabProgress = max(min(progress, 1), 0)
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selectedTab)
            .scrollClipDisabled()
        }
    }

    @ViewBuilder
    func ConnectListItem() -> some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(1...10, id: \.self) { index in

                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 60, height: 60)

                            VStack(alignment: .leading){
                                Text("Bob Smith")
                                    .customFont(.medium,18)
                                    .foregroundStyle(.black)
                                Text("Tom Clancy Divison 2")
                                    .customFont(.regular,12)
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                            HStack(alignment: .center, spacing: 5) {
                                Image(systemName: "gamecontroller.fill")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width: 20, height: 15)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.bgPurple)
                                   
                            )
                           

                        }
                        HStack {
                            VStack(alignment: .center,spacing: 0){
                                HStack{
                                    Text("Required Players:")
                                        .customFont(.regular,12)
                                    Spacer()
                                    Text("1/5")
                                        .customFont(.regular,12)
                                }
                                ProgressView(value: 1, total: 5)
                                    .progressViewStyle(LinearProgressViewStyle(tint: .bgPurple))

                            }
                            .frame(width: screenWidth / 3)
                            Spacer()
                            Text("2h ago")
                                .foregroundStyle(.black)
                                .customFont(.regular,12)
                        }

                    }
                    .padding()
                    .background(){
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.bgPrimary)
                            .matchedGeometryEffect(id: "controllerBackground\(index)", in: imageAnimation)
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.65, dampingFraction: 0.85)) {
                            selectedIndex = index
                            showDetailPage = true
                        }
                    }
                }
            }
            .padding(14)
        }
    }

    func RequestListItem() -> some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(1...10, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.red.gradient)
                        .frame(height: 150)
                }
            }
            .padding(14)
        }
    }

    @ViewBuilder
    private func CustomTabBarView() -> some View {
        HStack(spacing: 0) {
            ForEach(ConnectTab.allCases,id: \.rawValue) { tab in
                HStack(spacing: 10) {
                    Image(systemName: tab.systemImage)
                    Text(tab.rawValue)
                        .customFont(.regular,12)
                }
                .tag(tab)
                .frame(maxWidth: .infinity)
                .padding(.vertical,10)
                .contentShape(.capsule)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedTab = tab
                    }
                }
            }
        }
        .tabMask(tabProgress)
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth: CGFloat = size.width / CGFloat(ConnectTab.allCases.count)

                Capsule()
                    .fill(scheme == .dark ? .black : .bgPrimary)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        }
        .background(.black.opacity(0.5), in: .capsule)
        .padding(.horizontal,15)
    }
}

enum ConnectTab: String, CaseIterable {
    case connect = "Connect"
    case request = "Request"
    var systemImage: String {
        switch self {
        case .connect:
            return "point.3.filled.connected.trianglepath.dotted"
        case .request:
            return "arrow.up.forward.app"
        }
    }
}

#Preview {
    ConnectView()
}
