//
//  HistoryInteractor.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol HistoryObtaining {
    func obtainHistoryQuotes()
    
}

protocol HistoryQuoteRemoving {
    func removeHistoryQuote(quote: Quote)
}

class HistoryInteractor {
    private var presenter: HistoryPresenter
    private var historyQuotesWorker = HistoryQuoteWorker.instanse
    
    init(viewController: HistoryViewController?){
        self.presenter = HistoryPresenter(viewController: viewController)
    }
    
}

extension HistoryInteractor : HistoryObtaining {
    
    func obtainHistoryQuotes() {
        historyQuotesWorker.getAllQuotes(completer: { [weak self] result in
            switch result{
            case .success(let data):
                self?.presenter.presentHistoryQuotes(data:data)
            case .failure(let error):
                self?.presenter.presentError(error: error)
            }
        })
    }
}

extension HistoryInteractor : HistoryQuoteRemoving {
    
    func removeHistoryQuote(quote: Quote) {
        historyQuotesWorker.deleteQuote(quote: quote, completer: { [weak self] result in
            switch result{
            case .success(_):
                break
            case .failure(let error):
                self?.presenter.presentError(error: error)
            }
        })
    }
}
