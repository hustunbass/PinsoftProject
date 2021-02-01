//
//  FilmRatings.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 28.01.2021.
//

import Foundation


struct Ratings:Codable {
    
   var source: String?
   var value: String?
    
    enum CodingKeys: String, CodingKey{
        
            case source  = "Source"
            case value = "Value"
        }
}
