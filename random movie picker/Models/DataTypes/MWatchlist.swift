//
//  MWatchlist.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 13.03.2023.
//

import Foundation

struct MWatchlist: Codable {
    let page: Int
    let results: [MGetWatchlistResults]
    let total_pages: Int
    let total_results: Int
}
