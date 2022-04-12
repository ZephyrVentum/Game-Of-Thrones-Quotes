//
//  QuotePresenter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol QuotePresentationLogic {
    func presentData()
}

class QuotePresenter{
    weak var viewController: QuoteViewController?
}

extension QuotePresenter : QuotePresentationLogic {
    func presentData() {
        
    }
}