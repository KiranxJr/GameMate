//
//  TabModel.swift
//  GameMate
//
//  Created by admin on 10/07/25.
//

import  SwiftUI

/// App Tabs
enum TabModel: String, CaseIterable {
    case home = "Home"
    case connect = "Connect"
    case allSpace = "AllSpace"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .connect:
            return "arrow.trianglehead.2.clockwise.rotate.90"
        case .allSpace:
            return "globe.europe.africa.fill"
        case .profile:
            return "figure.wave"
        }
    }
    
    var index: Int {
        return TabModel.allCases.firstIndex(of: self) ?? 0
    }
}
