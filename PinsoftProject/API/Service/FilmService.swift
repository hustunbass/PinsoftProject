//
//  FilmService.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 28.01.2021.
//

import Foundation
import Alamofire

class Service {
    
    func fetchSearchData(title:String,callback: @escaping ([SearchResult]?)->Void){

        let params :Parameters = ["apikey":Constants.apiKey,"s":title]
        
        AF.request(Constants.baseUrl,method: .get,parameters: params).responseJSON {  response in
            
            guard let data = response.data else{return}
            
            do{
                let json = try JSONDecoder().decode(SearchMain.self, from: data)
                let result = json.Search
                callback(result)
                
            }catch{
                print("Error : \(error.localizedDescription)")
            }
        
        }
    }
    
    func fetchFilmDetail(title:String,callback: @escaping (FilmRequest?) -> Void){

        let params :Parameters = ["apikey":Constants.apiKey,"t":title]
        
        AF.request(Constants.baseUrl,method: .get,parameters: params).responseJSON {  response in
            
            guard let data = response.data else{return}
            
            do{
                let json = try JSONDecoder().decode(FilmRequest.self, from: data)
                callback(json)
                
            }catch{
                print("Error : \(error.localizedDescription)")
            }
        
        }
    }
        
    
}
