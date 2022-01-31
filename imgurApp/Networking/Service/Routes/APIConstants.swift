//
//  APIConstants.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 30/01/22.
//

import Foundation

public enum Endpoint: String {
    case gallery = "gallery"
    case album = "album"
    case tags = "tags"
}

struct APIConstants {
    
    static let shared = APIConstants()
    
    let baseURL: String = "https://api.imgur.com/"
    let apiVersion: Int = 3
    let clientId = "Client-ID fac75b5eb7cac5f"
    
    
    init() {
        
    }
}
