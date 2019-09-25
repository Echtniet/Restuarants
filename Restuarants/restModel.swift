//
//  restModel.swift
//  Restuarants
//
//  Created by Davelaar,Clinton B on 9/25/19.
//  Copyright © 2019 Davelaar,Clinton B. All rights reserved.
//

import Foundation

struct Rests {
    
    private static var _shared:Rests!
    static var shared:Rests{
        if _shared == nil{
            _shared = Rests()
        }
        return _shared
    }
    
    func numRests()->Int {
        return rests.count
    }
    
    private init(){}
    
    subscript(i:Int)-> Rest{
        return rests[i]
    }
    
    var rests = [Rest(name: "Subway", hours: "10-12"),
                 Rest(name: "Jimmy John's", hours: "10-12"),
                 Rest(name: "Applebee's", hours: "10-12")]
        
}

struct Rest{
    var name:String
    var hours:String
}
