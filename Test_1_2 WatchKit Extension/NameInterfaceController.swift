//
//  NameInterfaceController.swift
//  Test_1_2 WatchKit Extension
//
//  Created by Charmi Mehta on 2019-03-14.
//  Copyright © 2019 Charmi Mehta. All rights reserved.
//

import WatchKit
import Foundation


class NameInterfaceController: WKInterfaceController {

    @IBOutlet weak var nameBtn: WKInterfaceButton!
   // var userDefaults: UserDefaults!
     var userDefaults = UserDefaults.standard
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if  (self.userDefaults.string(forKey: "Name") != nil){
            print("i have user default")
            self.presentController(withName: "menuInterface", context: nil)
           // self.initial
        }
        else{
            print("i dont have user default")
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func nameBtnClickAction() {
        print("Button clicked")
        let suggestedResponses = [""]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) { (results) in
            
            // 2. write your code to process the person's response
            if (results != nil && results!.count > 0) {
                let userResponse = results?.first as! String
                //self.replayLbl.setText(userResponse)
               
                self.userDefaults.set(userResponse, forKey: "Name")
                self.userDefaults.synchronize()
                print(self.userDefaults.string(forKey: "Name"))
                 self.pushController(withName: "menuInterface", context: nil)
                
            }
        }
    }
    

       
        
    
    

}
