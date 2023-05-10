//
//  ObjectsProvider.swift
//  TaskTestPlace
//
//  Created by 123 on 09.05.2023.
//

import Foundation
import Foundation

protocol Provider {
    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
}

enum ObjectsProvider: Provider {
    case getObjects
}

enum HttpMethod: String{
    case get = "get"
}

extension ObjectsProvider {
    
    var baseURL: String {
        return "https://rsttur.ru/api/base-app"
    }
    
    var path: String {
        switch self {
        case .getObjects:
            return "/map"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getObjects:
            return .get
        }
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var params: [String: Any] {
        switch self {
        case .getObjects:
            return ["id": 117]
        }
    }
}
