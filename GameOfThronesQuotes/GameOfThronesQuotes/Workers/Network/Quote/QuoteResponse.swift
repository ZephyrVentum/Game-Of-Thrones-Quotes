//
//  QuoteResponse.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 13.04.2022.
//

import Foundation

struct QuoteResponse : Codable {
    let sentence: String
    let character: CharacterResponse
}

struct CharacterResponse : Codable {
    let name: String
    let slug: String
    let house: HouseResponse
}

struct HouseResponse : Codable {
    let name: String?
    let slug: String?
}
