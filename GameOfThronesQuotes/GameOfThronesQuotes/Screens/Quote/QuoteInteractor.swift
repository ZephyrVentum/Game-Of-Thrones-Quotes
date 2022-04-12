//
//  QuoteInteractor.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol QuoteBussinesLogic {
    func fetchRandomQuote()
}

class QuoteInteractor {
    var presenter: QuotePresenter?
    
}

extension QuoteInteractor:QuoteBussinesLogic{
    func fetchRandomQuote() {
        presenter?.presentData()
    }
}
