//
//  MService.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 13.03.2023.
//

import Foundation

final class MService {
    // Singleton
    static let shared = MService()
    
    // Constructor
    private init() {}
    
    enum MServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    // Sending api call
    public func execute<T: Codable>(_ request: MRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(MServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? MServiceError.failedToGetData))
                return
            }
            
            // Decode response
            do {
                //let json = try JSONSerialization.jsonObject(with: data)
                //print(String(describing: json))
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from mRequest: MRequest) -> URLRequest? {
        guard let url = mRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = mRequest.httpMethod
        return request
    }
}
