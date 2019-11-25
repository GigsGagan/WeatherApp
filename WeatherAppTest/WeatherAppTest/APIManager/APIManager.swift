//
//  APIManager.swift
//  WeatherAppTest
//
//  Created by gagan on 25/11/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation

class APIManager {
    
    struct ApiRequest {
        static let BaseURL = "http://api.worldweatheronline.com/premium/v1/search.ashx?"
        static let key = "38a3e3305ae34981a2b94952192411"
    }
    
    class func shared() -> APIManager {
        return APIManager()
    }
    
    
    // MARK:- API Method
    func getSearchData(_ search: String,completed:@escaping (_ success: Bool, _ response: [Details]?,_ error: String?) -> Void)  {
        
        let urlString: String = "\(ApiRequest.BaseURL)query=\(search)&num_of_results=10&format=json&key=\(ApiRequest.key)"
        
        let url: URL = URL(string: urlString)!
        URLSession.shared.dataTask(with: url as URL, completionHandler: {data, response, error -> () in
            
            guard let data = data else {
                return
            }
            do {
                let courses = try JSONDecoder().decode(SearchData.self, from: data)
                completed(true, courses.search_api.result, nil)
            } catch let jsonErr {
                completed(false, nil, jsonErr.localizedDescription)
            }
            
        }).resume()
    }
    
    func getSearchDetailData(_ lat: String,_ long: String,completed:@escaping (_ success: Bool, _ response: [WeatherDetails]?,_ error: String?) -> Void)  {

           let urlString: String = "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=\(ApiRequest.key)&q=\(lat),\(long)&num_of_days=2&tp=3&format=json"
           
           let url: URL = URL(string: urlString)!
           URLSession.shared.dataTask(with: url as URL, completionHandler: {data, response, error -> () in
               
               guard let data = data else {
                   return
               }
               do {
                   let courses = try JSONDecoder().decode(DetailData.self, from: data)
                completed(true, courses.data.current_condition, nil)
               } catch let jsonErr {
                   completed(false, nil, jsonErr.localizedDescription)
               }
               
           }).resume()
       }
}
