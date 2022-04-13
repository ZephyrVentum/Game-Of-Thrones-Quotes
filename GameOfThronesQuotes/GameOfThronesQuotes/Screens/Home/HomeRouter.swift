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

class HomeRouter {
    weak var viewController: HomeViewController?
}

extension HomeViewController : NavigateToQuoteTabDelegate {
    func navigateToQuoteTab(quote: Quote) {
        let quoteViewController = viewControllers?.first as? QuoteViewController
        quoteViewController?.quoteToShow = quote
        selectedIndex = 0
    }
}
