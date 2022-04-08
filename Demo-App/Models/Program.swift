//
//  Program.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import Foundation

// MARK: - Program
struct Programs: Codable {
    let total: Int
    let entries: [Entry]
}

// MARK: - Entry
struct Entry: Codable {
    let title, entryDescription: String
    let programType: ProgramType
    let images: Images
    let releaseYear: Int

    enum CodingKeys: String, CodingKey {
        case title
        case entryDescription = "description"
        case programType, images, releaseYear
    }
}

// MARK: - Images
struct Images: Codable {
    let posterArt: PosterArt

    enum CodingKeys: String, CodingKey {
        case posterArt = "Poster Art"
    }
}

// MARK: - PosterArt
struct PosterArt: Codable {
    let url: String
    let width, height: Int
}

enum ProgramType: String, Codable {
    case movie = "movie"
    case series = "series"
}

