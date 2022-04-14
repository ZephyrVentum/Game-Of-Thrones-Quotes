//
//  HomeViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 11.04.2022.
//

import UIKit

class HomeViewController: UITabBarController {

    private(set) var router: HomeRouter!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        router = HomeRouter(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.setup()
    }
}
