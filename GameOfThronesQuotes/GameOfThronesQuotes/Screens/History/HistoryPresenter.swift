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
        let viewModel = data.map { entity -> Quote in
            let quote = Quote(author: entity.author ?? "",
                              text: entity.text ?? "",
                              house: entity.house ?? "",
                              houseSlug: entity.houseSlug ?? "",
                              date: entity.date ?? Date())
            return quote
        }
        viewController?.displayHistoryQuotes(data: viewModel)
    }
}

extension HistoryPresenter : ErrorPresenting {
    
    func presentError(error: Error) {
        viewController?.handleError(error: error)
    }
}
