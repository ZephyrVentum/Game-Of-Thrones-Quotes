//
//  HomeViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 11.04.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private(set) var router: HomeRouter!
    
    weak var selectedTabIndexDelegate: SelectedTabIndexDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        selectedTabIndexDelegate?.didSelectTabIndex(index: item.title == "Quote" ? 0 : 1)
    }
    
    private func setup(){
        router = HomeRouter(viewController: self)
       
        tabBar.backgroundColor = .none
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().barTintColor = UIColor.clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.setup()
    }
}
