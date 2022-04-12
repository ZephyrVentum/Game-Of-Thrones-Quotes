//
//  HistoryViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import UIKit

protocol HistoryDisplayLogic {
    func displayData()
}

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var interactor: HistoryInteractor?
    
    private var historyQuotes = [String]()

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
        let presenter = HistoryPresenter()
        let interactor = HistoryInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    private func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyQuotes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HistoryViewController: HistoryDisplayLogic{
    func displayData() {

    }
        
}
