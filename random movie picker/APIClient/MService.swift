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
    
    // Sending api call
    public func execute<T: Codable>(_ request: MRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
