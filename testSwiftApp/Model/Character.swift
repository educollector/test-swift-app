//
//  Character.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 19/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import Foundation
import ObjectMapper

class Character: Mappable {
    
    var characterId: NSNumber?
    
    var  title: NSString?
    
    var abstract: NSString?
    
    var thumbnail: NSString?
    
    var imageWidth: NSNumber?
    
    var imageHeight: NSNumber?
    
    var url: NSString?
    
    required convenience init?(map: Map) {
        self.init()
    }

}
