//
//  Result.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 14.04.2022.
//

import Foundation

enum Result<Success, Failure: Error>{
    case success(Success)
    case failure(Failure)
}
