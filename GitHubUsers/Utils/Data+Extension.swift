//
//  Data+Extension.swift
//  RickAndMorty
//
//  Created by Francisco Lucena on 23/4/24.
//

import Foundation

extension Data {
    public func decodedResponse<T: Decodable>(_ type: T.Type) throws -> T? {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: self)
    }
}
