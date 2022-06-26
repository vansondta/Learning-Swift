//
//  GenericApi+Extension.swift
//  GenericAPICalls
//
//  Created by TheLightLove on 06/06/2022.
//

import Foundation

// MARK: function request all

extension URLSession {
    enum CustomError: Error {
        case invalidUrl
        case invaliData
    }
    
    func request<T: Codable>(url: URL?,
                             exepting: T.Type,
                             completion: @escaping(Result<T, Error>) -> Void ) {
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let err = error {
                    completion(.failure(err))
                } else {
                    completion(.failure(CustomError.invaliData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(exepting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
