//
//  ArcForWidget.swift
//  SafeBrowse
//
//  Created by Mohd Yasir on 23/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices


struct FrequentlyVisitedAnalyticsWidget : View {
    
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
                    
                }.padding(.top, 8)
                Spacer()
            }.padding(.leading).padding(.top, 16)
            Spacer()
            VStack{
                VStack{
                MyTextViews(value: "TOTAL TIME", size: 12, style: .SFProText_regular)
                MyTextViews(value: "1h 40m", size: 20, style: .SFProText_semibold)
                }
                DrawAnalyticsWidget().padding(.top, 8)
            }.padding(.trailing)
        }.foregroundColor(.white).frame(width: (UIScreen.main.bounds.width - 48), height: 170, alignment: .center).background(Color(red: 0.18, green: 0.18, blue: 0.19).cornerRadius(12)).padding(.top, 8).padding(.bottom, 8)
    }
}


struct ArcWidget: InsettableShape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(70)
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

struct DrawAnalyticsWidget : View{
    var body : some View{
        HStack{
            ZStack{
                
                
                ArcWidget(startAngle: .degrees(0), endAngle: .degrees(130), clockwise: true)
                    .strokeBorder(Color(red: 0.80, green: 0.80, blue: 0.31), lineWidth: 17)
                    .frame(width: 70, height: 70)
                
                
                
                ArcWidget(startAngle: .degrees(130 + 3), endAngle: .degrees(130 + 3 + 70), clockwise: true)
                    .strokeBorder(Color(red: 0.91, green: 0.66, blue: 0.56), lineWidth: 17)
                    .frame(width: 70, height: 70)
             
                
                ArcWidget(startAngle: .degrees(130 + 3 + 70 + 3), endAngle: .degrees(130 + 3 + 70 + 3 + 70), clockwise: true)
                    .strokeBorder(Color(red: 0.50, green: 0.97, blue: 0.62), lineWidth: 17)
                    .frame(width: 70, height: 70)
               
                ArcWidget(startAngle: .degrees(130 + 3 + 70 + 3 + 70 + 3), endAngle: .degrees(360-3), clockwise: true)
                    .strokeBorder(Color(red: 0.57, green: 0.65, blue: 0.92), lineWidth: 17)
                    .frame(width: 70, height: 70)
                
                
            }
        }
    }
}

struct smallView : View{
    var body : some View{
        VStack{
            
        VStack(alignment : .leading){
            
            HStack{
                
                Circle()
                    .fill(Color(red: 0.80, green: 0.80, blue: 0.31))
                    .frame(width: 8, height: 8)
                MyTextViews(value: "Medium (38 Min)", size: 12, style: .SFProText_regular).foregroundColor(.white)
            
            }
            
            HStack{
                Circle()
                    .fill(Color(red: 0.91, green: 0.66, blue: 0.56))
                    .frame(width: 8, height: 8)
                MyTextViews(value: "Leetcode (26 Min)", size: 12, style: .SFProText_regular).foregroundColor(.white)
            }
            
            HStack{
                Circle()
                    .fill(Color(red: 0.50, green: 0.97, blue: 0.62))
                    .frame(width: 8, height: 8)
                MyTextViews(value: "Google (26 Min)", size: 12, style: .SFProText_regular).foregroundColor(.white)
            }
    
            
        }.padding(.top, 8)
            
            DrawAnalyticsWidget().padding(.bottom,16)
        }
    }
}
