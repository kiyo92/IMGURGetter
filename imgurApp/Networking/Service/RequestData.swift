//
//  RequestData.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 29/01/22.
//

import Alamofire

struct RequestData {
    var url: String
    var method: HTTPMethod
    var encoding: ParameterEncoding
    var parameters: [String : Any]?
}
