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
        var tempEntities = [QuoteEntity]()
        for i in 0...11 {
            let tempEntity = QuoteEntity(id: 0,
                                         author: "Govno \(i)",
                                         text: "govno govno \(i)",
                                         house: "Govno",
                                         date: "01/01/1970")
            
            tempEntities.append(tempEntity)
        }
        presenter?.presentHistoryQuotes(data:tempEntities)
    }
}
