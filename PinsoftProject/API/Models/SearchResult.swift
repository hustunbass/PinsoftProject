//
//  SearchResult.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 28.01.2021.
//

import Foundation


struct SearchResult:Codable {
    
    var title : String?
    var year : String?
    var imdbID : String?
    var poster : String?
    var type: String?
    
    enum CodingKeys: String, CodingKey{
        
            case type  = "Type"
            case title = "Title"
            case year = "Year"
            case imdbID = "imdbID"
            case poster = "Poster"
        }
}
