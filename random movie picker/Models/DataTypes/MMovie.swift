//
//  MMovie.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 13.03.2023.
//

import Foundation

struct MMovie: Codable {
    let adult: Bool
    let backdrop_path: String
    // let belongs_to_collection: NSNull
    let budget: Int
    let genres: [MGenres]
    let homepage: String
    let id: Int
    let imdb_id: String
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    // let production_companies: NSNull
    // let production_countries: NSNull
    let release_date: String
    let revenue: Int
    let runtime: Int
    let spoken_languages: [MLanguages]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let vote_average: Int
    let vote_count: Int
}
