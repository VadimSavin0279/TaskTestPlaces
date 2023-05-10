//
//  APIManager.swift
//  TaskTestPlace
//
//  Created by 123 on 09.05.2023.
//

import Foundation

enum Result<T: Codable> {
    case success(T)
    case failure(Error)
}

class APIManager {
    func sendRequest<T, U>(with target: T, decodeType: U.Type, completion: @escaping (Result<U>) -> ()) where T: Provider, U: Decodable {
        let defaultSession = URLSession(configuration: .default)
        if let url = URL(string: target.baseURL + target.path) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = target.method.rawValue
            urlRequest.allHTTPHeaderFields = target.headers
            
            var queryItems: [URLQueryItem] = []
            for (key, value) in target.params {
                if let str = value as? String {
                    queryItems.append(URLQueryItem(name: key, value: str))
                }
            }
            urlRequest.url?.append(queryItems: queryItems)
            
            defaultSession.dataTask(with: urlRequest) { data, response, error in
                switch error {
                case .none:
                    do {
                        guard let data = data else { return }
                        let json = try JSONDecoder().decode(U.self, from: data)
                        completion(.success(json))
                    } catch {
                        completion(.failure(error))
                    }
                case .some(let wrapped):
                    completion(.failure(wrapped))
                }
                    
            }.resume()
            
        }
        
    }
}
