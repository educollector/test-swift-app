//
//  TestTarget.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 18/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import UIKit
import Moya


enum TestTarget {
    case simpleRequest
    case zen
    case showUser(id: Int)
    case createUser(firstName: String, lastName: String)
    case updateUser(id:Int, firstName: String, lastName: String)
    case showAccounts
}

// MARK: - TargetType Protocol Implementation

extension TestTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.twitter.com/1.1/")!
    }
    
    var path: String {
        return "statuses/update.json"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return [:]
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default // Send parameters in URL
        //return JSONEncoding.default // Send parameters as JSON in request body
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .request
    }
    
    var validate: Bool{
        return false;
    }
    
    
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
