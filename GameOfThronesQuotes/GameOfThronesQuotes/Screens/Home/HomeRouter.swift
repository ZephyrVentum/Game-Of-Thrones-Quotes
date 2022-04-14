//
//  HomeRouter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 13.04.2022.
//

import Foundation

protocol NavigateToQuoteTabDelegate: AnyObject {
    func navigateToQuoteTab(quote: Quote)
}

protocol SetupToQuoteTabDelegate {
    func setup()
}

class HomeRouter {
    weak var viewController: HomeViewController?
    
    init(viewController: HomeViewController?){
        self.viewController = viewController
    }
}

extension HomeRouter : NavigateToQuoteTabDelegate {
    
    func navigateToQuoteTab(quote: Quote) {
        let quoteViewController = viewController?.viewControllers?.first as? QuoteViewController
        quoteViewController?.router?.handleHistoryQuoteDelegate?.handleHistoryQuote(quote: quote)
        viewController?.selectedIndex = 0
    }
}

extension HomeRouter : SetupToQuoteTabDelegate {
    
     func setup(){
        let historyViewController = viewController?.viewControllers?.last as? HistoryViewController
        historyViewController?.router.quoteTabDelegate = self
    }
}
