//
//  ErrorHandler.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 15.04.2022.
//

import Foundation
import UIKit

protocol ErrorHandling {
    func handleError(error: Error)
}

class ErrorHandler {
    
    static func showErrorDialog(title: String = "Error",
                                message: String = "Ups... Something went wrong!",
                                error: Error,
                                viewController: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        alert.addAction(UIAlertAction(title: "Details", style: .default, handler: { action in
            showDetailedErrorDialog(error: error, viewController: viewController)
        }))
        viewController.present(alert, animated: true)
    }
    
    static func showDetailedErrorDialog(title: String = "Error details",
                                        error: Error,
                                        viewController: UIViewController){
        let alert = UIAlertController(title: title, message: String("\(error)"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        viewController.present(alert, animated: true)
    }
    
}
