//
//  InterfaceController.swift
//  Test_1_2 WatchKit Extension
//
//  Created by Charmi Mehta on 2019-03-14.
//  Copyright © 2019 Charmi Mehta. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    //MARK: Sequence group and images
    @IBOutlet weak var seqGroup: WKInterfaceGroup!
    @IBOutlet weak var image1: WKInterfaceImage!
    
    @IBOutlet weak var image2: WKInterfaceImage!
    
    @IBOutlet weak var image3: WKInterfaceImage!
    
    @IBOutlet weak var image4: WKInterfaceImage!
    
    //MARK: Answer Images
    @IBOutlet weak var ansGroup: WKInterfaceGroup!
    @IBOutlet weak var ans1: WKInterfaceImage!
    
    
    @IBOutlet weak var ans2: WKInterfaceImage!
    
    
    @IBOutlet weak var ans2Group: WKInterfaceGroup!
    @IBOutlet weak var ans3: WKInterfaceImage!
    
    @IBOutlet weak var ans4: WKInterfaceImage!
    
    //MARK: Images Button
    
    @IBOutlet weak var imgBtn1: WKInterfaceButton!
    
    @IBOutlet weak var imgBtn3: WKInterfaceButton!
    
    @IBOutlet weak var imgBtn4: WKInterfaceButton!
    @IBOutlet weak var imgBtn2: WKInterfaceButton!
    @IBOutlet weak var timerCount:WKInterfaceTimer!
    var listImage : [String : String] = [:]
    var resultList: [String : String] = [:]
   // var imageList:[ImageObject] = []
    var result = ""
    //Timers
    var theTimer = Timer()
    var time : Int!
    var backgroundTimer : TimeInterval!
    


    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if(context != nil){
            print("my own context is set\(context)")
            time = context! as! Int
        }
        else{
            print("not set")
        }
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
       // self.createData()
        
       listImage = ["image1" : "Chicken" ,"image2" : "Cow", "image3": "Tree"  , "image4" :"Pot"]
        //let demoImage = ["seqImage" : listImage]
        
        for images in listImage{
            //print(images["image1"])
            //image1.setImage(images["image1"]!))
       // image1.setImage(UIImage(named: (demoImage["seqImage", "image1"])))
            image1.setImage(UIImage(named: listImage["image1"]!))
            image2.setImage(UIImage(named: listImage["image2"]!))
            image3.setImage(UIImage(named: listImage["image3"]!))
            image4.setImage(UIImage(named: listImage["image4"]!))
        }
        
        //TimerFunction
        backgroundTimer = TimeInterval(time)
        timerCount.setDate(Date(timeIntervalSinceNow: TimeInterval(time)))

        let startTime = timerCount.setDate(Date(timeIntervalSinceNow: TimeInterval(time)))
        //timerCount.setDate(startTime)
        timerCount.start()
        
        // This will call timerCountDown() once per second until conditions are met.
        theTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountDown), userInfo: nil, repeats: true)
       
      
        
    }
    
    
    
    @objc func timerCountDown() {
        backgroundTimer -= 1.0
        print(backgroundTimer)
        if backgroundTimer == 0 {
            theTimer.invalidate()
            timerCount.stop()
            
            // You could call an Alert Action here.
           print("Timer Done!")
            hideSeq()
        }
        
    }
    
    func hideSeq(){
        
        seqGroup.setHidden(true)
        timerCount.stop()
        timerCount.setHidden(true)
        
    }
    
    @IBAction func btn1() {
        print("Button clicked")
       let suggestedResponses = ["Cow","Chicken", "Pot" ,"Tree"]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) { (results) in
            
            // 2. write your code to process the person's response
            if (results != nil && results!.count > 0) {
                var userResponse = results?.first as! String
                //self.replayLbl.setText(userResponse)
                self.ans1.setImage(UIImage(named: userResponse))
                
               
                print(userResponse)
                if(userResponse == self.listImage["image1"]){
                    print("True")
                    self.resultList["image1"] =  userResponse
                   // self.resultList.
                     self.checkResult()
                    
                    
                }
                else{
                    self.result = "You Loss"
                    self.presentController(withName: "menuInterface", context: self.result)
                    print("False")
                }
                
            }
           
        }
    }
    
    @IBAction func btn2() {
        print("Button clicked")
        let suggestedResponses = ["Cow","Chicken", "Pot" ,"Tree"]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) { (results) in
            
            // 2. write your code to process the person's response
            if (results != nil && results!.count > 0) {
                let userResponse = results?.first as! String
                //self.replayLbl.setText(userResponse)
                 self.ans2.setImage(UIImage(named: userResponse))
                print(userResponse)
                print(userResponse)
                if(userResponse == self.listImage["image2"]){
                    print("True")
                    self.resultList["image2"] =  userResponse
                     self.checkResult()
                }
                else{
                    self.result = "You Loss"
                    self.presentController(withName: "menuInterface", context: self.result)
                    print("False")
                }
                
            }
        }
    }
    
    @IBAction func btn3() {
        print("Button clicked")
       let suggestedResponses = ["Cow","Chicken", "Pot" ,"Tree"]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) { (results) in
            
            // 2. write your code to process the person's response
            if (results != nil && results!.count > 0) {
                let userResponse = results?.first as! String
                //self.replayLbl.setText(userResponse)
                 self.ans3.setImage(UIImage(named: userResponse))
                print(userResponse)
                print(userResponse)
                if(userResponse == self.listImage["image3"]){
                    print("True")
                    self.resultList["image3"] =  userResponse
                    self.checkResult()
                    
                }
                else{
                    self.result = "You Loss"
                    self.presentController(withName: "menuInterface", context: self.result)
                    print("False")
                }
                
            }
        }
    }
    
    @IBAction func btn4() {
        print("Button clicked")
        let suggestedResponses = ["Cow","Chicken", "Pot" ,"Tree"]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) { (results) in
            
            // 2. write your code to process the person's response
            if (results != nil && results!.count > 0) {
                let userResponse = results?.first as! String
                //self.replayLbl.setText(userResponse)
                 self.ans4.setImage(UIImage(named: userResponse))
                print(userResponse)
                print(userResponse)
                if(userResponse == self.listImage["image4"]){
                    print("True")
                    self.resultList["image4"] =  userResponse
                    
                    print("my new dictionary: \(self.resultList)")
                   
                   self.checkResult()
                   // for 
                    
                }
                else{
                    self.result = "You Loss"
                    self.presentController(withName: "menuInterface", context: self.result)
                    print("False")
                }
                
            }
        }
    }
    
   func checkResult()
   {
    if(self.resultList == self.listImage){
        self.result = "You Win"
        self.presentController(withName: "menuInterface", context: self.result)
    }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
