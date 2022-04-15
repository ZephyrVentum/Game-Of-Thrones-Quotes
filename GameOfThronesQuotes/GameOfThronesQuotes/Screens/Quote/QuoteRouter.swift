//
//  QuoteRouter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 14.04.2022.
//

import Foundation
import UIKit

protocol HistoryQuouteShowing {
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

extension QuoteRouter : HistoryQuouteShowing {
    
    func showHistoryQuote(quote: Quote) {
        handleHistoryQuoteDelegate?.handleHistoryQuote(quote: quote)
    }
}

extension QuoteRouter : ErrorDialogShowing {
    
    func showErrorDialog(error: Error) {
        guard let viewController = self.viewController else { return }
        ErrorHandler.showErrorDialog(error: error, viewController: viewController)
    }
}
