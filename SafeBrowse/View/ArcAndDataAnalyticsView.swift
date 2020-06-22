//
//  ArcAndDataAnalyticsView.swift
//  SafeBrowse
//
//  Created by mohammad mugish on 22/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

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

struct FrequentlyVisitedAnalytics : View {
    var body : some View{
        HStack{
            VStack(alignment : .leading){
                MyTextViews(value: "Weekly Report", size: 22, style: .SFProText_bold)
                
                VStack(alignment : .leading){
                    HStack{
                        Circle()
                            .fill(Color(red: 0.80, green: 0.80, blue: 0.31))
                            .frame(width: 8, height: 8)
                        MyTextViews(value: "Stack overflow (38 Min)", size: 12, style: .SFProText_regular)
                    }
                    
                    HStack{
                        Circle()
                            .fill(Color(red: 0.91, green: 0.66, blue: 0.56))
                            .frame(width: 8, height: 8)
                        MyTextViews(value: "Leetcode (26 Min)", size: 12, style: .SFProText_regular)
                    }
                    
                    HStack{
                        Circle()
                            .fill(Color(red: 0.50, green: 0.97, blue: 0.62))
                            .frame(width: 8, height: 8)
                        MyTextViews(value: "Google (26 Min)", size: 12, style: .SFProText_regular)
                    }
                    
                    HStack{
                        Circle()
                            .fill(Color(red: 0.57, green: 0.65, blue: 0.92))
                            .frame(width: 8, height: 8)
                        MyTextViews(value: "Medium (10 Min)", size: 12, style: .SFProText_regular)
                    }
                    
                }.padding(.top, 16)
                Spacer()
            }.padding(.leading).padding(.top, 16)
            Spacer()
            VStack{
                MyTextViews(value: "TOTAL TIME", size: 12, style: .SFProText_regular)
                MyTextViews(value: "1h 40m", size: 20, style: .SFProText_semibold)
                
                DrawAnalytics()
            }.padding(.trailing).padding(.top, 16)
        }.foregroundColor(.white).frame(width: (UIScreen.main.bounds.width - 48), height: 190, alignment: .center).background(Color(red: 0.18, green: 0.18, blue: 0.19).cornerRadius(12)).padding(.top, 8)
    }
}
