//
//  QuoteRouter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 14.04.2022.
//

import Foundation

protocol ShowHistoryQuoute {
    func showHistoryQuote(quote: Quote)
}

class QuoteRouter {
    
    weak var viewController: QuoteViewController?
    weak var handleHistoryQuoteDelegate: HandleHistoryQuote?
    
    init(viewController: QuoteViewController?, handleHistoryQuoteDelegate: HandleHistoryQuote?){
        self.viewController = viewController
        self.handleHistoryQuoteDelegate = handleHistoryQuoteDelegate
    }
}

extension QuoteRouter: ShowHistoryQuoute {
    
    func showHistoryQuote(quote: Quote) {
        handleHistoryQuoteDelegate?.handleHistoryQuote(quote: quote)
    }
}
