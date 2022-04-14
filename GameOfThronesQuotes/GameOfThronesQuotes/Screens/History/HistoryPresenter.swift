//
//  HistoryPresenter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol HistoryPresentation {
    func presentHistoryQuotes(data: [QuoteEntity])
}

class HistoryPresenter {
    weak var viewController: HistoryViewController?
    
    init(viewController: HistoryViewController?){
        self.viewController = viewController
    }
}

extension HistoryPresenter : HistoryPresentation {
    
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
