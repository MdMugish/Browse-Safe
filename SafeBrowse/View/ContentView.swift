//
//  ContentView.swift
//  SafeBrowse
//
//  Created by mohammad mugish on 21/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    
    
    @ObservedObject var WebViewModal = viewModal()
    
    var body: some View {
        
        VStack{
            SearchBar(WebViewModal : WebViewModal).padding(.top, 8).padding(.bottom, 8).background(Color.white)
            
            Color(red: 0.78, green: 0.75, blue: 0.75).frame(width: UIScreen.main.bounds.width, height: 1, alignment: .center).padding(.top, -8)
            
            ScrollView(.vertical, showsIndicators: true, content: {
                
                
                VStack{
                    Favourites(WebViewModal: WebViewModal)
                    FrequentlyVisited(WebViewModal: WebViewModal)
                    FrequentlyVisitedAnalytics()
                    Blocked(presendBlockView: $WebViewModal.presentBlockView, WebViewModal: WebViewModal)
                    
                    Spacer()
                }
            }).padding(.top, -16).onTapGesture {
                self.endEditing()
            }
        }.sheet(isPresented: $WebViewModal.status){
            WebBrowserView(WebViewModal: self.WebViewModal)
        }.background(Color(red: 0.89, green: 0.89, blue: 0.89))
            
            
            .modal(isPresented: $WebViewModal.presentBlockView){
                
                
                VStack  {
                    
                   
                    MyTextViews(value: "Please enter your website which you want to block", size: 16, style: .SFProText_regular).padding(.horizontal, 32).multilineTextAlignment(.center)
                    
                    ZStack(alignment : .trailing){
                        Image("blockInputImage").resizable().frame(width: 283, height: 33, alignment: .center).scaledToFit().padding()
                        
                        TextField("http://", text: self.$WebViewModal.enterNewWebsiteForBlock, onEditingChanged: { (changed) in
                            
                        }) {
                            
                           self.WebViewModal.addblockWebsite()
                            self.WebViewModal.enterNewWebsiteForBlock = ""
                            self.WebViewModal.presentBlockView = false
                            
                        }.keyboardType(.webSearch).autocapitalization(.none) .disableAutocorrection(true)
                            .onTapGesture {
                              self.WebViewModal.enterNewWebsiteForBlock = ""
                        }.padding(.horizontal, 40)
                        
                        
                        Button(action: {
                            self.WebViewModal.addblockWebsite()
                            self.WebViewModal.enterNewWebsiteForBlock = ""
                            self.WebViewModal.presentBlockView = false
                        }) {
                            MyTextViews(value: "Add", size: 12, style: .SFProText_semibold).foregroundColor(.white).padding(.trailing, 28)
                        }
                       
                    }
                    
                    Button(action: {
                        self.WebViewModal.enterNewWebsiteForBlock = ""
                        self.WebViewModal.presentBlockView = false
                    }) {
                        MyTextViews(value: "Cancel", size: 16, style: .SFProText_regular).frame(width: 124, height: 33, alignment: .center).background(Color(red: 0.11, green: 0.10, blue: 0.27).cornerRadius(17)).foregroundColor(.white)
                    }
                    
                }.padding().frame(width: UIScreen.main.bounds.width - 48, height: 205, alignment: .center).background(Color.white.shadow(color: Color.black.opacity(0.7), radius: 6, x: 0, y: 3))
                    .cornerRadius(19)
                
                
                
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func endEditing() {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SafariView: UIViewControllerRepresentable{
    
    
    func makeCoordinator() -> SafariView.Coordinator {
        Coordinator(self)
    }
    
    let url: URL
    
    @Binding var status : Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        
        var a = SFSafariViewController(url: url)
        a.delegate = context.coordinator
        
        return a
    }
    
    
    
    func updateUIViewController(_ uiViewController: SFSafariViewController ,
                                context: UIViewControllerRepresentableContext<SafariView>) {
        
        
        
    }
    
    class Coordinator: NSObject, SFSafariViewControllerDelegate{
        
        var parent: SafariView
        init(_ parent: SafariView) {
            self.parent = parent
            
        }
        
        
        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            controller.dismiss(animated: true) {
                print("DIsmissed")
                self.parent.status = false
                
            }
        }
        
    }
    
    
    
    
}

struct SearchBar : View{
    
    @ObservedObject var WebViewModal : viewModal
    
    var body : some View{
        ZStack{
            HStack{
                Spacer()
                Image(systemName: "magnifyingglass")
                
                TextField("Search or enter website name", text: $WebViewModal.website, onEditingChanged: { (changed) in
                    
                }) {
                    
                    self.WebViewModal.status = self.WebViewModal.checkWebsite()
                    
                }.keyboardType(.webSearch).autocapitalization(.none) .disableAutocorrection(true)
                    .onTapGesture {
                        self.WebViewModal.website = ""
                }
                Spacer()
            }.foregroundColor(.black)
            
            
        }.frame(width: UIScreen.main.bounds.width - 32, height: 32, alignment: .center).background(Color.init(red: 0.89, green: 0.89, blue: 0.89)).cornerRadius(13).padding(.horizontal, 16)
    }
}

struct Favourites : View{
    
    @ObservedObject var WebViewModal : viewModal
    
    var body : some View{
        VStack(alignment : .leading){
            MyTextViews(value: "Favourites", size: 20, style: .SFProText_bold)
            
            
            HStack(alignment : .top){
                Button(action: {
                    self.WebViewModal.website = "https://medium.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "M", title: "Medium", color: Color(red: 0.52, green: 0.48, blue: 0.48), WebViewModal :  self.WebViewModal).padding(.trailing, 16)
                }
                
                
                
                Button(action: {
                    self.WebViewModal.website = "https://google.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "G", title: "Google", color: Color(red: 0.15, green: 0.14, blue: 0.14), WebViewModal :  self.WebViewModal ).padding(.trailing, 16)
                }
                
                
                Button(action: {
                    self.WebViewModal.website = "https://web.whatsapp.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "W", title: "WhatsApp", color: Color(red: 0.52, green: 0.48, blue: 0.48), WebViewModal :  self.WebViewModal ).padding(.trailing, 16)
                }
                
                Button(action: {
                    self.WebViewModal.website = "https://apple.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "A", title: "Apple", color: Color(red: 0.15, green: 0.14, blue: 0.14), WebViewModal :  self.WebViewModal)
                }
                
                
            }.padding(.top, 16)
        }.padding(.horizontal, 24).padding(.top, 32).sheet(isPresented: $WebViewModal.status){
            WebBrowserView(WebViewModal: self.WebViewModal)
        }
    }
    
}

struct FrequentlyVisited : View{
    
    @ObservedObject var WebViewModal : viewModal
    
    var body : some View{
        VStack(alignment : .leading){
            MyTextViews(value: "Frequently Visited", size: 20, style: .SFProText_bold)
            HStack(alignment : .top){
                
                Button(action: {
                    self.WebViewModal.website = "https://stackoverflow.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "S", title: "Stack OverFlow", color: Color(red: 0.36, green: 0.35, blue: 0.70), WebViewModal :  self.WebViewModal).padding(.trailing, 16)
                }
                
                
                Button(action: {
                    self.WebViewModal.website = "http://leetcode.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "L", title: "LeetCode", color: Color(red: 0.06, green: 0.10, blue: 0.39),WebViewModal :  self.WebViewModal).padding(.trailing, 16)
                }
                
                
                Button(action: {
                    self.WebViewModal.website = "http://google.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "G", title: "Google", color: Color(red: 0.36, green: 0.35, blue: 0.70), WebViewModal :  self.WebViewModal ).padding(.trailing, 16)
                }
                
                
                
                Button(action: {
                    self.WebViewModal.website = "http://medium.com"
                    self.WebViewModal.status = true
                }) {
                    SmallButtonView(heading: "M", title: "Medium", color: Color(red: 0.06, green: 0.10, blue: 0.39), WebViewModal :  self.WebViewModal)
                }
                
                
            }.padding(.top, 16)
        }.padding(.horizontal, 24).padding(.top, 32).sheet(isPresented: $WebViewModal.status){
            WebBrowserView(WebViewModal: self.WebViewModal)
        }
    }
}

struct Blocked : View{
    @Binding var presendBlockView : Bool
    @ObservedObject var WebViewModal : viewModal
    var body : some View{
        
        VStack(alignment : .leading){
            
            Button(action: {
                self.presendBlockView = true
            }) {
                HStack{
                    MyTextViews(value: "Blocked ", size: 20, style: .SFProText_bold)
                    Image(systemName : "plus.circle.fill")
                }
            }.buttonStyle(PlainButtonStyle()).padding(.horizontal, 8)
            
              ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment : .top){
              
                    
                
                ForEach(WebViewModal.listOfBlockWebsites, id: \.self) { nameOfBlockWebsite in
                    Button(action: {
                                       
                                   }) {
                                    SmallButtonView(heading: "\(nameOfBlockWebsite.prefix(1))".uppercased(), title: "\(nameOfBlockWebsite)".capitalized, color: Color(red: 0.62, green: 0.25, blue: 0.25), WebViewModal : self.WebViewModal).padding(.trailing, 16)
                    }
                    }
                     Spacer()
                }.padding(.horizontal, 8).background(Color(red: 0.89, green: 0.89, blue: 0.89))
                
               
      
            }
        }.padding(.horizontal, 16).padding(.top, 32)
        
    }
}











