//
//  QuotesApiWorker.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 14.04.2022.
//

import Foundation

class QuotesApiWorker{
    private var randomQuoteUrl = "https://game-of-thrones-quotes.herokuapp.com/v1/random"
    
    func getRandomQuote(completer: @escaping (Result<QuoteResponse, Error>) -> Void){
        URLSession.shared.dataTask(with: URL(string: self.randomQuoteUrl)!, completionHandler: { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completer(Result.failure(NetworkError.badResponse))
                }
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completer(Result.failure(NetworkError.badStatusCode(httpResponse.statusCode)))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completer(Result.failure(NetworkError.badData))
                }
                return
            }
            do {
                let quoteResponse = try JSONDecoder().decode(QuoteResponse.self, from: data)
                DispatchQueue.main.async {
                    completer(Result.success(quoteResponse))
                }
            } catch {
                DispatchQueue.main.async {
                    completer(Result.failure(NetworkError.badData))
                }
            }
        }).resume()
    }
}
