//
//  HomeViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 16.04.2022.
//

import UIKit

protocol SelectedTabIndexDelegate : AnyObject {
    
    func didSelectTabIndex(index: Int)
}

class HomeViewController: UIViewController, SelectedTabIndexDelegate {
    
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
            tabBarVC?.selectedTabIndexDelegate = self
        }
    }
    
    func didSelectTabIndex(index: Int) {
        if (index == 0){
            selectedQuoteTab()
        } else {
            selectedHistoryTab()
        }
    }
    
    @IBAction func quoteTabButtonClicked(_ sender: Any) {
        tabBarVC?.selectedIndex = 0
        selectedQuoteTab()
    }
    
    @IBAction func historyTabButtonClicked(_ sender: Any) {
        tabBarVC?.selectedIndex = 1
        selectedHistoryTab()
    }
    
    private func selectedQuoteTab() {
        quoteTabButton.setImage(UIImage(named: "quote_tab_button_active.png"), for: .normal)
        historyTabButton.setImage(UIImage(named: "history_tab_button_inactive.png"), for: .normal)
    }
    
    private func selectedHistoryTab() {
        quoteTabButton.setImage(UIImage(named: "quote_tab_button_inactive.png"), for: .normal)
        historyTabButton.setImage(UIImage(named: "history_tab_button_active.png"), for: .normal)
    }
    
}
