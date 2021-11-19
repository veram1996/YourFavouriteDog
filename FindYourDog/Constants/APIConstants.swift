//
//  APIConstants.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 19/11/21.
//

import Foundation

struct APIConstants {
    static let headerAuthKeyAPIKey = "x-api-key"
    static let headerAuthKeyAPIValue = "5556ad72-c076-445c-a088-fd11db1ee084"
    static let baseURL =  "https://api.thedogapi.com/v1/"
//    "Content-Type" : "application/json; charset=utf-8"
    static let header = [APIConstants.headerAuthKeyAPIKey : APIConstants.headerAuthKeyAPIValue]
    
    // Path URL
    static let breeds = "breeds"
}
