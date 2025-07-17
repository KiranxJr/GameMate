//
//  TabShape.swift
//  GameMate
//
//  Created by admin on 11/07/25.
//

import SwiftUI

struct TabShape: Shape {
    var midPoint: CGFloat

    var animatableData: CGFloat {
        get { midPoint }
        set { midPoint = newValue }
    }

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.addPath(Rectangle().path(in: rect))

            // Inward dip curve
            path.move(to: CGPoint(x: midPoint - 60, y: 0))

            let to = CGPoint(x: midPoint, y: 50)
            let control1 = CGPoint(x: midPoint - 25, y: 0)
            let control2 = CGPoint(x: midPoint - 50, y: 50)

            path.addCurve(to: to, control1: control1, control2: control2)

            let to1 = CGPoint(x: midPoint + 60, y: 0)
            let control3 = CGPoint(x: midPoint + 50, y: 50)
            let control4 = CGPoint(x: midPoint + 25, y: 0)

            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}


#Preview {
    MainView()
}
