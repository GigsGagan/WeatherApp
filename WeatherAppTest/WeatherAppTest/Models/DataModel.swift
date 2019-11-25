//
//  DataModel.swift
//  WeatherAppTest
//
//  Created by gagan on 25/11/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Search Data
struct SearchData: Codable {
    var search_api: result
}

struct result: Codable {
    var result : [Details]
}

struct Details: Codable {
    var areaName: [area]
    var latitude : String?
    var longitude : String?
}

struct area: Codable {
    var value: String?
}

//MARK:- Detail Data
struct DetailData: Codable {
    var data: current_condition
}

struct current_condition: Codable {
    var current_condition : [WeatherDetails]
}

struct WeatherDetails: Codable {
    var humidity: String?
    var weatherIconUrl: [Link]
    var weatherDesc: [Description]
}

struct Link: Codable {
    var value: String?
}

struct Description: Codable {
    var value: String?
}
