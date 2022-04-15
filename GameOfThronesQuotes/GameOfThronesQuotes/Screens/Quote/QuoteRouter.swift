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

protocol ErrorDialogShowing {
    func showErrorDialog(error: Error)
}

protocol ErrorDetailsShowing {
    func showErrorDetails(error: Error)
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
        let alert = UIAlertController(title: "Error", message: "Ups... Something went wrong!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        alert.addAction(UIAlertAction(title: "Details", style: .default, handler: {action in
            self.showErrorDetails(error: error)
        }))
        viewController?.present(alert, animated: true)
    }
}

extension QuoteRouter : ErrorDetailsShowing {
    
    func showErrorDetails(error: Error) {
        let alert = UIAlertController(title: "Error details", message: String("\(error)"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        viewController?.present(alert, animated: true)
    }
}
