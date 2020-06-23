//
//  DrawArc.swift
//  SafeBrowse
//
//  Created by Mohd Yasir on 23/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices


struct Arc: InsettableShape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
}

struct DrawAnalytics : View{
    var body : some View{
        HStack{
            ZStack{
                
                Arc(startAngle: .degrees(0), endAngle: .degrees(130), clockwise: true)
                    .strokeBorder(Color(red: 0.80, green: 0.80, blue: 0.31), lineWidth: 17)
                    .frame(width: 115, height: 115)
                
                //
                Arc(startAngle: .degrees(130 + 3), endAngle: .degrees(130 + 3 + 90), clockwise: true)
                    .strokeBorder(Color(red: 0.91, green: 0.66, blue: 0.56), lineWidth: 17)
                    .frame(width: 115, height: 115)
                ////
                ////
                //
                Arc(startAngle: .degrees(130 + 3 + 90 + 3), endAngle: .degrees(130 + 3 + 90 + 3 + 90), clockwise: true)
                    .strokeBorder(Color(red: 0.50, green: 0.97, blue: 0.62), lineWidth: 17)
                    .frame(width: 115, height: 115)
                //
                Arc(startAngle: .degrees(130 + 3 + 90 + 3 + 90 + 3), endAngle: .degrees(360-3), clockwise: true)
                    .strokeBorder(Color(red: 0.57, green: 0.65, blue: 0.92), lineWidth: 17)
                    .frame(width: 115, height: 115)
                
                
                
                Image("AnalyticsImage").resizable().frame(width: 35, height: 37, alignment: .center)
                
                
            }
        }
    }
}
