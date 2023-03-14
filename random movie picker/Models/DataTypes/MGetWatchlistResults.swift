//
//  MGetWatchlistResults.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 13.03.2023.
//

import Foundation

struct MGetWatchlistResults: Codable {
    let adult: Bool
    // let backdrop_path: null
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let release_date: String
    // let poster_path: null,
    let popularity: Float
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: String
}

