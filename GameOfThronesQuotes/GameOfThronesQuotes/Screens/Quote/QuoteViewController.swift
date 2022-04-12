//
//  QuoteViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import UIKit

protocol QuoteDisplayLogic {
    func displayData()
}

class QuoteViewController: UIViewController {

    private var interactor: QuoteInteractor?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let presenter = QuotePresenter()
        let interactor = QuoteInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension QuoteViewController: QuoteDisplayLogic{
    func displayData() {

    }
        
}
