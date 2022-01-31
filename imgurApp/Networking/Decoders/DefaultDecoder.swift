//
//  DefaultDecoder.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 29/01/22.
//

import Foundation

class DefaultDecoder<T:Decodable> {
    var expectation: T.Type
    
    init(expectation: T.Type) {
        self.expectation = expectation
    }
    
    func decode(from data: Data) -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(expectation.self, from: data)
    }
}
