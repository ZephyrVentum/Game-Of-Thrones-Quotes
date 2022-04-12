//
//  HistoryInteractor.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol HistoryBussinesLogic {
    func obtainHistoryQuotes()
}

class HistoryInteractor {
    var presenter: HistoryPresenter?
    
}

extension HistoryInteractor: HistoryBussinesLogic {
    func obtainHistoryQuotes() {
        presenter?.presentData()
    }
}
