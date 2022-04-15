//
//  QuotePresenter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol QuotePresentation {
    func presentQuote(data: Quote)
}

protocol HistoryQuotePresentation {
    func presentHistoryQuote(quote: Quote)
}

class QuotePresenter {
    weak var viewController: QuoteViewController?
    
    init(viewController: QuoteViewController?){
        self.viewController = viewController
    }
}

extension QuotePresenter : QuotePresentation {
    
    func presentQuote(data: Quote) {
        viewController?.showQuote(quote: data)
    }
}

extension QuotePresenter : ErrorPresenting {
    
    func presentError(error: Error) {
        viewController?.handleError(error: error)
    }
}

extension QuotePresenter : HistoryQuotePresentation {
    
    func presentHistoryQuote(quote: Quote) {
        viewController?.showQuote(quote: quote)
    }
}
