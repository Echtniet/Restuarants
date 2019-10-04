//
//  restModel.swift
//  Restuarants
//
//  Created by Davelaar,Clinton B on 9/25/19.
//  Copyright © 2019 Davelaar,Clinton B. All rights reserved.
//

import Foundation

class Rests {
    
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
    
    private var rests = [Rest(name: "Subway", hours: "10-12", menu: ["4"]),
                 Rest(name: "Jimmy John's", hours: "10-12", menu: ["4"]),
                 Rest(name: "Applebee's", hours: "10-12", menu: ["6", "8"])]
    
    func deleteRest(index:Int){
        rests.remove(at: index)
    }
    
    func addRest(rest:Rest){
        rests.append(rest)
    }
}

struct Rest{
    var name:String
    var hours:String
    var menu:[String]
}
