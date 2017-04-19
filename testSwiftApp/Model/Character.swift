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
    
    var title: NSString?
    
    var abstract: NSString?
    
    var thumbnail: NSString?
    
    var imageWidth: NSNumber?
    
    var imageHeight: NSNumber?
    
    var url: NSString?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    private func unwrapedDescription(value: Any?) -> String {
        if let value = value {
            return "\(value)"
        }
        return "[no data]"
    }
    
    var description: String {
        var _result = " characterId: \(unwrapedDescription(value: characterId))\n"
        _result += " title: \(unwrapedDescription(value: title))\n"
        _result += " abstract: \(unwrapedDescription(value: abstract))\n"
        _result += " thumbnail: \(unwrapedDescription(value: thumbnail))\n"
        _result += " imageWidth: \(unwrapedDescription(value: imageWidth))\n"
        _result += " imageHeight: \(unwrapedDescription(value: imageHeight))\n"
        _result += " url: \(unwrapedDescription(value: url))\n"
        
        return _result
    }
    
    func mapping(map: Map) {
        characterId      <- map["characterId"]
        title            <- map["title"]
        abstract         <- map["abstract"]
        imageWidth       <- map["imageWidth"]
        imageHeight      <- map["imageHeight"]
        url              <- map["url"]
    }


}
