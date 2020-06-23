//
//  ArcAndDataAnalyticsView.swift
//  SafeBrowse
//
//  Created by mohammad mugish on 22/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

import SwiftUI
import SafariServices



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
