//
//  ImageObject.swift
//  Test_1_2 WatchKit Extension
//
//  Created by Charmi Mehta on 2019-03-14.
//  Copyright © 2019 Charmi Mehta. All rights reserved.
//

import WatchKit

class ImageObject: NSObject {
    // MARK:
    //var name: String?
    var image: String?
    
    override convenience init(){
        self.init(image:"image_1")
    }
    
    init(image:String){
        self.image = image
        //self.name = name
    }
    

}
