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
    private var presenter: QuotePresenter
    
    init(viewController: QuoteViewController?){
        self.presenter = QuotePresenter(viewController: viewController)
    }
}

extension QuoteInteractor : RandomQuoteFetching{
    
    func fetchRandomQuote() {
        quouteApiWorker.getRandomQuote(completer: { result in
            switch result {
            case .success(let data):
                self.presenter.presentQuote(data: data)
            case .failure(let error):
                self.presenter.presentError(error: error)
            }
        })
    }
}

extension QuoteInteractor : HandleHistoryQuote {
    
    func handleHistoryQuote(quote: Quote) {
        presenter.presentHistoryQuote(quote: quote)
    }
}
