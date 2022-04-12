//
//  HistoryPresenter.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import Foundation

protocol HistoryPresentationLogic {
    func presentData()
}

class HistoryPresenter{
    weak var viewController: HistoryViewController?
}

extension HistoryPresenter : HistoryPresentationLogic {
    func presentData() {
        
    }
}
