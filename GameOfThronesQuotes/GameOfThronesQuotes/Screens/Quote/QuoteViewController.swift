//
//  QuoteViewController.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import UIKit

protocol ShowQuote {
    func showQuote(quote: Quote)
}

protocol ShowErrorDialog {
    func showErrorDialog(error: Error)
}


class QuoteViewController: UIViewController {
    private var interactor: QuoteInteractor!
    private(set) var router: QuoteRouter!
    
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBAction func didRandomQuoteClick(_ sender: Any) {
        interactor.fetchRandomQuote()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        interactor = QuoteInteractor(viewController: self)
        router = QuoteRouter(viewController: self,
                             handleHistoryQuoteDelegate: interactor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension QuoteViewController: ShowQuote {
    
    func showQuote(quote: Quote) {
        guard isViewLoaded else { return }
        quoteAuthor.text = quote.author
    }
}

extension QuoteViewController : ShowErrorDialog {
    
    func showErrorDialog(error: Error) {
        //todo show dialog
    }
}
