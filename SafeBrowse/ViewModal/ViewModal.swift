//
//  ViewModal.swift
//  SafeBrowse
//
//  Created by mohammad mugish on 21/06/20.
//  Copyright © 2020 mohammad mugish. All rights reserved.
//

import Foundation
import Combine



class viewModal : ObservableObject , Identifiable {
    
    var id =  UUID()
    @Published var website : String = ""
    
    @Published var status : Bool = false {
        willSet{
            if newValue {
                startTimerForBlockWebsite()
            }else{
                resetTimerForBlockWebsite()
            }
        }
    }
    
    @Published var listOfBlockWebsites : [String] = ["youtube"]
    @Published var presentBlockView : Bool = false
    @Published var timerCount  : Int = 0
    @Published var enterNewWebsiteForBlock = ""
    var timer : Timer?
    
    
    func checkWebsite() -> Bool {
        
        if website == ""{
            return false
        }else if !website.contains("https://"){
            website = "https://\(website)"
            return true
        }else{
            website = "https://\(website)"
            return true
        }
        
    }
    
    func checkThisWebsiteIsBlocked() -> Bool{

        for blockWebsite in listOfBlockWebsites{
           if self.website.contains(blockWebsite){
                return true
           }
        }
        return false
   
    }
    
    
    func addblockWebsite(){
        var filterValue : String = ""
        
        if enterNewWebsiteForBlock.contains("www."){
            filterValue  = enterNewWebsiteForBlock.replacingOccurrences(of: "www.", with: "", options: [.caseInsensitive, .regularExpression])
        }
        
        if enterNewWebsiteForBlock.contains("http://") {
             filterValue  = filterValue.replacingOccurrences(of: "http://", with: "", options: [.caseInsensitive, .regularExpression])
        }
        
        if enterNewWebsiteForBlock.contains(".com") {
            filterValue  = filterValue.replacingOccurrences(of: ".com", with: "", options: [.caseInsensitive, .regularExpression])
        }

        if filterValue != ""{
            listOfBlockWebsites.append(filterValue)
        }else if enterNewWebsiteForBlock != ""{
            listOfBlockWebsites.append(enterNewWebsiteForBlock)
        }
       
        
        print(listOfBlockWebsites)
    }
    
    func startTimerForBlockWebsite(){
        print("Start timer")
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.timerCount = self.timerCount + 1
                print("Timer Started \(self.timerCount)")
                   
            }
        }
       
    }
    
   
    func resetTimerForBlockWebsite(){
        
        self.timer?.invalidate()
        timerCount = 0
        print("Timer Invalidated")
    }
    
}
