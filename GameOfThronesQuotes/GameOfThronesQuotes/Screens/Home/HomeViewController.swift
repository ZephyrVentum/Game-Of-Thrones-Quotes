//
//  HomeViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 11.04.2022.
//

import UIKit

class HomeViewController: UITabBarController {

    private(set) var router: HomeRouter?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let tabBarController = self
        let router = HomeRouter()
        router.viewController = tabBarController
        tabBarController.router = router
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHistoryRouter()
    }
    
    private func setupHistoryRouter(){
        let historyViewController = viewControllers?.last as? HistoryViewController
        historyViewController?.router?.quoteTabDelegate = router?.viewController
    }
}
