//
//  MenuInterfaceController.swift
//  Test_1_2 WatchKit Extension
//
//  Created by Charmi Mehta on 2019-03-14.
//  Copyright © 2019 Charmi Mehta. All rights reserved.
//

import WatchKit
import Foundation


class MenuInterfaceController: WKInterfaceController {

    @IBOutlet weak var nameLabel: WKInterfaceLabel!
  // var result: InterfaceController!
   // var data : [String : String] = [:]

    //time variable
    var time : Int!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    var result : String!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
      // self.result = context as? InterfaceController
        if(context != nil){
            //self.result
            print("hello delegate ")
            
            self.result = context as! String
           // result = context as! String
            print(self.result!)
        }
        else{
            self.result = ""
        }
       
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let preferences = UserDefaults.standard
        self.setTitle("")
        
        print("SHARED PREFERENCES OUTPUT")
        print(preferences.string(forKey: "Name"))
        nameLabel.setText("Hi \(preferences.string(forKey: "Name")!)  ")
           resultLabel.setText("\(self.result!)  ")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func easyBtn() {
        time = 5
        self.presentController(withName: "interfaceController", context: time)
        //self.popToRootController()
    }
    
    @IBAction func hardBtn() {
       // self.pushController(withName: "interfaceController", context: self)
        time = 2
        self.presentController(withName: "interfaceController", context: time)
    }
    
}
