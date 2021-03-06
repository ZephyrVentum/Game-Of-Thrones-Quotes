//
//  HistoryQuotesWorker.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 15.04.2022.
//

import Foundation
import UIKit

class HistoryQuoteWorker {
    private init() {}
    static var instanse = HistoryQuoteWorker()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveQuote(quote: Quote, completer: @escaping (Result<Void, Error>) -> Void) {
        let newItem = QuoteEntity(context: context)
        newItem.author = quote.author
        newItem.house = quote.house
        newItem.text = quote.text
        newItem.houseSlug = quote.houseSlug
        newItem.date = quote.date
        do {
            try context.save()
            DispatchQueue.main.async {
                completer(.success(Void()))
            }
        }
        catch {
            DispatchQueue.main.async {
                completer(.failure(error))
            }
        }
    }
    
    func getAllQuotes(completer: @escaping (Result<[QuoteEntity], Error>) -> Void) {
        do {
            let items = try context.fetch(QuoteEntity.fetchRequest())
            DispatchQueue.main.async {
                completer(.success(items))
            }
        }
        catch {
            DispatchQueue.main.async {
                completer(.failure(error))
            }
        }
    }
    
    func deleteQuote(quote: Quote, completer: @escaping (Result<Void, Error>) -> Void) {
        do {
            let request = QuoteEntity.fetchRequest()
            request.predicate = NSPredicate(format: "\(#keyPath(QuoteEntity.text)) = %@ AND date = %@", quote.text, quote.date as NSDate)
            let items = try context.fetch(request)
            guard
                let item = items.first
                else { return }
            context.delete(item)
            try context.save()
            DispatchQueue.main.async {
                completer(.success(Void()))
            }
        }
        catch {
            DispatchQueue.main.async {
                completer(.failure(error))
            }
        }
    }
}
