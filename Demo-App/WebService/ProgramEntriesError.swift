//
//  ProgramEntriesErrors.swift
//  Demo-App
//
//  Created by Saravanan Rethinam on 7/4/22.
//

import Foundation

enum ProgramEntriesError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestUrlString
    case failedRequestError(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequestError(let description):
            return description
        case .invalidResponseModel, .invalidRequestUrlString:
            return ""
        }
    }
}
