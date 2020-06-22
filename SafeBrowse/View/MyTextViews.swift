//
//  MyViews.swift
//  SafeBrowse
//
//  Created by mohammad mugish on 21/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

import SwiftUI

struct MyTextViews: View {
    
    @State var value : String
    @State var size : CGFloat
    @State var style : MyFontStyle
    
    
    var body: some View {
        Text("\(value)").font(.custom(style.rawValue, size: size))
    }
}



