//
//  WebBrowserView.swift
//  SafeBrowse
//
//  Created by mohammad mugish on 22/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//
import SwiftUI
import SafariServices

struct WebBrowserView : View{
    
    @ObservedObject var WebViewModal : ViewModel
    
    var body : some View{
        VStack{
            
            if self.WebViewModal.checkThisWebsiteIsBlocked(){
                VStack{
                    MyTextViews(value: "Visiting to this website is not good for you. \n You already spent", size: 16, style: .SFProText_medium).multilineTextAlignment(.center)
                    
                    Text("\(self.WebViewModal.timerCount) Sec")
                    
                    
                    
                    
                }.foregroundColor(.white).frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center).background(Color(red: 0.70, green: 0.26, blue: 0.26))
            }
            
            SafariView(url: URL(string: "\(self.WebViewModal.website)")!, status: self.$WebViewModal.status)
            
        }
    }
}
