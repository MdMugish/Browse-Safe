//
//  SmallButtonView.swift
//  SafeBrowse
//
//  Created by mohammad mugish on 22/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

import SwiftUI
import SafariServices

struct SmallButtonView : View{
    @State var heading: String
    @State var title : String
    @State var color : Color
     @ObservedObject var WebViewModal : ViewModel
    var body : some View{
        VStack{
            ZStack{
                MyTextViews(value: "\(heading)", size: 45, style: .SFProText_regular).foregroundColor(.white)
            }.frame(width: 66, height: 66, alignment: .center).background(color.cornerRadius(12).shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 3)).contextMenu{
                
                Button(action: {
                    if let index  = self.WebViewModal.listOfBlockWebsites.firstIndex(of: "\(self.title)".lowercased()){
                        self.WebViewModal.listOfBlockWebsites.remove(at: index)
                    }
                }) {
                    HStack{
                        Text("Delete")
                        Image(systemName: "trash")
                    }
                }

            }
            MyTextViews(value: "\(title)", size: 12, style: .SFProText_bold).foregroundColor(.black).padding(.top, 4).multilineTextAlignment(.center)
        }
    }
}
