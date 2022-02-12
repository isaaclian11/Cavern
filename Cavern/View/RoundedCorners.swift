//
//  RoundedCorners.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/11/22.
//

import SwiftUI

struct RoundedCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
