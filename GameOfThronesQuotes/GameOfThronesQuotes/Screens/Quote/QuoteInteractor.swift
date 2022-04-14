//
//  QuoteInteractor.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol QuoteBussinesLogic {
    func fetchRandomQuote()
}

class QuoteInteractor {
    private var quouteApiWorker = QuotesApiWorker()
    var presenter: QuotePresenter?
}

extension QuoteInteractor:QuoteBussinesLogic{
    func fetchRandomQuote() {
        quouteApiWorker.getRandomQuote(completer: { result in
            switch result {
            case .success(let data):
                self.presenter?.presentQuoteResponse(data: data)
                print(data)
            case .failure(let error):
                print(error)
            }
        })
    }
}
