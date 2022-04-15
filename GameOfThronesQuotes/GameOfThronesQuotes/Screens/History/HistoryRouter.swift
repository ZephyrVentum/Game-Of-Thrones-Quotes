//
//  HistoryRouter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 13.04.2022.
//

import Foundation

protocol HistoryRoutingLogic {
    func navigateToQuoteTab(quote: Quote)
}

class HistoryRouter {
    weak var viewController: HistoryViewController?
    weak var quoteTabDelegate: NavigateToQuoteTabDelegate?
    
    init(viewController: HistoryViewController?){
        self.viewController = viewController
    }
}

extension HistoryRouter : HistoryRoutingLogic {
    
    func navigateToQuoteTab(quote: Quote) {
        quoteTabDelegate?.navigateToQuoteTab(quote: quote)
    }
}

extension HistoryRouter : ErrorDialogShowing {
    
    func showErrorDialog(error: Error) {
        guard let viewController = self.viewController else { return }
        ErrorHandler.showErrorDialog(error: error, viewController: viewController)
    }
}
