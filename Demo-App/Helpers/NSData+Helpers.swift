//
//  NSData+Helpers.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import Foundation

public extension Data {
    static func jsonFromFile(fileName: String, bundle: Bundle) -> Data {
        return dataFromFile(fileName: fileName, ofType: "json", bundle: bundle)
    }

    static func dataFromFile(fileName: String, ofType: String, bundle: Bundle) -> Data {
        if let path = bundle.path(forResource: fileName, ofType: ofType) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print("dataFromFile \(fileName) not found")
                return Data()
            }
        }
        print("dataFromFile \(fileName) not found")
        return Data()
    }
}
