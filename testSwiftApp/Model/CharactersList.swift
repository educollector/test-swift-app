//
//  CharactersList.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 20/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import Foundation
import ObjectMapper

class CharactersList: Mappable {
    
    var characters: [Character]?
    var basepath: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        characters     <- map["items"]
    }

}
