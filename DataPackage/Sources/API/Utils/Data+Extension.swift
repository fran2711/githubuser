//
//  Data+Extension.swift
//  RickAndMorty
//
//  Created by Francisco Lucena on 23/4/24.
//

import Foundation

extension Data {
#if DEBUG
    func prettyPrint() {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let dataJSON = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
        else { return }
        print(NSString(data: dataJSON, encoding: String.Encoding.utf8.rawValue) ?? "")
    }
#endif
    
    public func decodedResponse<T: Decodable>(_ type: T.Type) throws -> T? {
        do {
            return try JSONDecoder().decode(type, from: self)
        } catch {
            #if DEBUG
            Logger.log(
                .debug,
                .repository,
                message: "DECODING ERROR: \(self.prettyPrint())\nERROR: \(error)"
            )
            #else
            Logger.log(
                .debug,
                .repository,
                message: "DECODING ERROR:\nERROR: \(error)"
            )
            #endif
            throw error
        }
    }
}
