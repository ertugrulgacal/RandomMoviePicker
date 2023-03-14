//
//  MReadApiKeyJson.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 14.03.2023.
//

import Foundation

class ReadJson: Decodable {
    let api_key: String
    
    init(){
        guard let source = Bundle.main.url(forResource: "apikey", withExtension: "json") else {
            fatalError("Couldnt find apikey")
        }

        guard let data = try? Data(contentsOf: source) else {
            fatalError("Couldnt cover data")
        }

        let decoder = JSONDecoder()
        guard let apikey = try? decoder.decode(ReadJson.self , from: data) else {
            fatalError("Problem reading data")
        }
        
        self.api_key = apikey.api_key
    }
}
