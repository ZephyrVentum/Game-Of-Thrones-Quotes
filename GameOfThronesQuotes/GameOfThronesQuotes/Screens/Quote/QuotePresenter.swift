//
//  QuotePresenter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol QuotePresentationLogic {
    func presentQuoteResponse(data: QuoteResponse)
}

class QuotePresenter{
    weak var viewController: QuoteViewController?
}

extension QuotePresenter : QuotePresentationLogic {
    func presentQuoteResponse(data: QuoteResponse) {
        viewController?.quoteToShow = Quote(id: 0,
                                            author: data.character.name,
                                            text: data.sentence,
                                            house: data.character.house.name ?? "",
                                            date: "01/01/1970")
    }

}
