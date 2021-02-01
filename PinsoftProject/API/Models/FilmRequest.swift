//
//  FilmRequest.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 28.01.2021.
//

import Foundation

struct FilmRequest:Codable {
    
        var title : String?
        var year : String?
        var rated: String?
        var released: String?
        var runtime: String?
        var genre: String?
        var director: String?
        var writer : String?
        var actors: String?
        var plot: String?
        var language: String?
        var country: String?
        var awards: String?
        var poster:String?
        var metascore: String?
        var imdbRating: String?
        var imdbVotes: String?
        var imdbID: String?
        var type: String?
        var dvd: String?
        var boxOffice: String?
        var production: String?
        var website: String?
        var response: String?
    
        enum CodingKeys: String, CodingKey{
        
            case title  = "Title"
            case year = "Year"
            case rated = "Rated"
            case released = "Released"
            case runtime = "Runtime"
            case genre = "Genre"
            case director = "Director"
            case writer = "Writer"
            case actors = "Actors"
            case plot = "Plot"
            case language = "Language"
            case country = "Country"
            case awards = "Awards"
            case poster = "Poster"
            case metascore = "Metascore"
            case imdbRating = "imdbRating"
            case imdbVotes = "imdbVotes"
            case imdbID = "imdbID"
            case type = "Type"
            case dvd = "DVD"
            case boxOffice = "BoxOffice"
            case production = "Production"
            case website = "Website"
            case response = "Response"
        }
}

