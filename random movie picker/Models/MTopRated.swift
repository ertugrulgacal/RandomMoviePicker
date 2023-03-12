//
//  MTopRated.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 13.03.2023.
//

import Foundation

struct MTopRated: Codable {
    let page: Int
    let results: MGetTopRatedResults
    let total_results: Int
    let total_pages: Int
}
