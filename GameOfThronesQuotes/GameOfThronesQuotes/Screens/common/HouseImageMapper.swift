//
//  HouseImageMapper.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 17.04.2022.
//

import Foundation

class HouseImageMapper {
    
    static func mapHouseImage(houseSlug: String) -> String {
        var imageName: String = "unknown_house.png"
        switch houseSlug {
        case "tully":
            imageName = "tully_house.png"
        case "tyrell":
            imageName = "tyrell_house.png"
        case "lannister":
            imageName = "lannister_house.png"
        case "targaryen":
            imageName = "targaryen_house.png"
        case "stark":
            imageName = "stark_house.png"
        case "baratheon":
            imageName = "baratheon_house.png"
        case "martell":
            imageName = "martell_house.png"
        case "greyjoy":
            imageName = "greyjoy_house.png"
        case "arryn":
            imageName = "arryn_house.png"
        default:
            imageName = "unknown_house.png"
        }
        return imageName
    }
}
