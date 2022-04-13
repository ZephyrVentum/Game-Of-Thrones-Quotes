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

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var interactor: HistoryInteractor?
    private(set) var router: HistoryRouter?
    
    private var historyQuotes = [Quote]()

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
        let router = HistoryRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        interactor?.obtainHistoryQuotes()
    }
    
    private func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(
            UINib(
                nibName: "HistoryCell",
                bundle: nil),
            forCellReuseIdentifier: HistoryCell.cellIdentifier)
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
        guard
            let cell = tableView.dequeueReusableCell(
            withIdentifier: HistoryCell.cellIdentifier,
            for: indexPath) as? HistoryCell
        else { return UITableViewCell() }
        cell.setup(data: historyQuotes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.navigateToQuoteTab(quote: historyQuotes[indexPath.row])
    }
}

extension HistoryViewController: HistoryDisplayLogic{
    
    func displayHistoryQuotes(data: [Quote]) {
        historyQuotes.removeAll()
        historyQuotes.append(contentsOf: data)
        tableView.reloadData()
    }
}
