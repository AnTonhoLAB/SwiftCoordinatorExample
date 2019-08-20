//
//  DecodeExtension.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

enum DecodeError: Error {
    case decodingError
}

// Generic decode to decode any object
class Decode {
    static func decodeObject<T>(type: T.Type, from data: Data) throws -> T where T: Decodable  {
        let decoder = JSONDecoder()
        do {
            let objectFromDecode = try decoder.decode(T.self, from: data)
            return objectFromDecode
        } catch {
            throw DecodeError.decodingError
        }}
}
