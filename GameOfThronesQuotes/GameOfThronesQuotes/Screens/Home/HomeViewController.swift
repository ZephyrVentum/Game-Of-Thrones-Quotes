//
//  HomeViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 16.04.2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var quoteTabButton: UIButton!
    @IBOutlet weak var historyTabButton: UIButton!
    
    private weak var tabBarVC: TabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TabBarController {
            tabBarVC = vc
        }
    }
    
    @IBAction func quoteTabButtonClicked(_ sender: Any) {
        tabBarVC?.selectedIndex = 0
        quoteTabButton.setImage(UIImage(named: "quote_tab_button_active.png"), for: .normal)
        historyTabButton.setImage(UIImage(named: "history_tab_button_inactive.png"), for: .normal)
    }
    @IBAction func historyTabButtonClicked(_ sender: Any) {
        tabBarVC?.selectedIndex = 1
        quoteTabButton.setImage(UIImage(named: "quote_tab_button_inactive.png"), for: .normal)
        historyTabButton.setImage(UIImage(named: "history_tab_button_active.png"), for: .normal)
    }
    
}
