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

class QuoteViewController: UIViewController {
    private var interactor: QuoteInteractor!
    private(set) var router: QuoteRouter!
    
    @IBOutlet weak var topBar: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBAction func didRandomQuoteClick(_ sender: Any) {
        guard loadingIndicator.isHidden else { return }
        loadingIndicator.startAnimating()
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
        configureActivityIndicator()
    
    }
    
    private func configureActivityIndicator(){
        loadingIndicator.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        loadingIndicator.hidesWhenStopped = true
    }
    
    @IBAction func githubButtonClicked(_ sender: Any) {
        guard let url = URL(string: "https://github.com/ZephyrVentum/Game-Of-Thrones-Quotes") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func linkedInButtonClicked(_ sender: Any) {
        guard let url = URL(string: "https://www.linkedin.com/in/zephyr-ventum/") else { return }
        UIApplication.shared.open(url)
    }
    
}

extension QuoteViewController: ShowQuote {
    
    func showQuote(quote: Quote) {
        guard isViewLoaded else { return }
        loadingIndicator.stopAnimating()
        quoteAuthor.text = quote.author
        quoteText.text = quote.text
        houseImage.image = UIImage(named: HouseImageMapper.mapHouseImage(houseSlug: quote.houseSlug))
    }
}

extension QuoteViewController : ErrorHandling {
    
    func handleError(error: Error) {
        loadingIndicator.stopAnimating()
        //todo return to IDLE state
        router.showErrorDialog(error: error)
    }
}
