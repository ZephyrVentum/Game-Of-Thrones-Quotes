//
//  HistoryViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import UIKit

protocol HistoryDisplayLogic {
    func displayHistoryQuotes(data: [Quote])
}

class HistoryViewController : UIViewController {
    private var interactor: HistoryInteractor!
    private(set) var router: HistoryRouter!
    private var historyQuotes = [Quote]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        interactor = HistoryInteractor(viewController: self)
        router = HistoryRouter(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.obtainHistoryQuotes()
    }
    
    private func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension HistoryViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HistoryCell.cellIdentifier,
            for: indexPath) as! HistoryCell
        cell.setup(data: historyQuotes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router.navigateToQuoteTab(quote: historyQuotes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            interactor.removeHistoryQuote(quote: historyQuotes[indexPath.row])
            historyQuotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension HistoryViewController : HistoryDisplayLogic{
    
    func displayHistoryQuotes(data: [Quote]) {
        historyQuotes.removeAll()
        historyQuotes.append(contentsOf: data)
        tableView.reloadData()
    }
}

extension HistoryViewController : ErrorHandling {
    
    func handleError(error: Error) {
        router.showErrorDialog(error: error)
    }
}
