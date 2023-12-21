//
//  RequestHandler.swift
//  RecipeCookbook
//
//  Created by Shruti Mendon on 21/12/23.
//

import Foundation

class RequestHandler {
    
    static let shared = RequestHandler()
    
    func serviceCallFromAPI<T: Decodable>(_ endpoint: String, _ completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard
            let url = Utility.shared.getURL(endpoint: endpoint)
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard
                let data = data
            else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let model = try jsonDecoder.decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(.badURL))
            }
        }
        task.resume()
    }
}
