//
//  QuoteInteractor.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol RandomQuoteFetching {
    func fetchRandomQuote()
}

protocol HandleHistoryQuote : AnyObject{
    func handleHistoryQuote(quote: Quote)
}

class QuoteInteractor {
    private var quouteApiWorker = QuotesApiWorker()
    private var historyQuotesWorker = HistoryQuoteWorker.instanse
    private var presenter: QuotePresenter
    
    init(viewController: QuoteViewController?){
        self.presenter = QuotePresenter(viewController: viewController)
    }
}

extension QuoteInteractor : RandomQuoteFetching{
    
    func fetchRandomQuote() {
        quouteApiWorker.getRandomQuote(completer: { [weak self] result in
            switch result {
            case .success(let data):
                let quote =  Quote(
                    author: data.character.name,
                    text: data.sentence,
                    house: data.character.house.name ?? "",
                    houseSlug: data.character.house.slug ?? "",
                    date: Date())
                self?.historyQuotesWorker.saveQuote(quote: quote, completer: {result in
                    switch result {
                    case .success(_):
                        self?.presenter.presentQuote(data: quote)
                    case .failure(let error):
                        self?.presenter.presentQuote(data: quote)
                        self?.presenter.presentError(error: error)
                    }
                })
            case .failure(let error):
                self?.presenter.presentError(error: error)
            }
        })
    }
}

extension QuoteInteractor : HandleHistoryQuote {
    
    func handleHistoryQuote(quote: Quote) {
        presenter.presentHistoryQuote(quote: quote)
    }
}
