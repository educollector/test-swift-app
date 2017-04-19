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
    case listOfTopArticles
    case searchForPhrase(phrase: String)
}

// MARK: - TargetType Protocol Implementation

extension TestTarget: TargetType {
    
    var baseURL: URL {
        switch self {
        case .listOfTopArticles:
            return URL(string: "https://gameofthrones.wikia.com/api/v1/Articles/Top")!
        case .searchForPhrase( _):
            return URL(string: "https://gameofthrones.wikia.com/api/v1/Search/List")!
        }
    }
    
    var path: String {
        switch self {
            case .listOfTopArticles:
                return "?expand=1&category=Characters&limit=75"
        case .searchForPhrase(let phrase):
                return "?query=\(phrase)&limit=25&minArticleQuality=10&batch=1&namespaces=0%2C14"
        }
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
