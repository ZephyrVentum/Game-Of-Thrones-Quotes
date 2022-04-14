//
//  QuotePresenter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol QuotePresentation {
    func presentQuote(data: QuoteResponse)
}

protocol ErrorPresentation{
    func presentError(error: Error)
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
    
    func presentQuote(data: QuoteResponse) {
        viewController?.showQuote(quote: Quote(id: 0,
                                            author: data.character.name,
                                            text: data.sentence,
                                            house: data.character.house.name ?? "",
                                            date: "01/01/1970"))
    }
}

extension QuotePresenter : ErrorPresentation {
    
    func presentError(error: Error) {
        viewController?.showErrorDialog(error: error)
    }
}

extension QuotePresenter : HistoryQuotePresentation {
    
    func presentHistoryQuote(quote: Quote) {
        viewController?.showQuote(quote: quote)
    }
}
