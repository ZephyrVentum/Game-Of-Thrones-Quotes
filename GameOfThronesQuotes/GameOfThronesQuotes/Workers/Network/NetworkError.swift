//
//  NetworkError.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 14.04.2022.
//

import Foundation

enum NetworkError: Error {
  case badResponse
  case badStatusCode(Int)
  case badData
}
