//
//  HistoryPresenter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol HistoryPresentationLogic {
    func presentHistoryQuotes(data: [QuoteEntity])
}

class HistoryPresenter{
    weak var viewController: HistoryViewController?
}

extension HistoryPresenter : HistoryPresentationLogic {
    
    func presentHistoryQuotes(data: [QuoteEntity]) {
        let viewModel = data.map{ entity -> Quote in
            let quote = Quote(id: entity.id,
                              author: entity.author,
                              text: entity.text,
                              house: entity.house,
                              date: entity.date)
            return quote
        }
        viewController?.displayHistoryQuotes(data: viewModel)
    }
}
