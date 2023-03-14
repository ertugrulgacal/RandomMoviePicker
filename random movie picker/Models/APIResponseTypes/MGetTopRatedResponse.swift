//
//  MGetTopRatedResponse.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 13.03.2023.
//

import Foundation

struct MGetTopRatedResponse: Codable {
    struct Info: Codable {
        let page: Int
        let results: [MGetTopRatedResults]
        let total_results: Int
        let total_pages: Int
    }
    
    let info: Info
}
