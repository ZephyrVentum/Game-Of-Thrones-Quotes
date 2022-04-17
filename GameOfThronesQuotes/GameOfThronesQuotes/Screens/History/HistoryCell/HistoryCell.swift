//
//  HistoryCell.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 12.04.2022.
//

import UIKit

class HistoryCell: UITableViewCell {

    static let cellIdentifier = "HistoryCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var divider: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
        // Configure the view for the selected state
    }
    
    func setup(data: Quote){
        title.text = data.author
        content.text = data.text
        houseImage.image = UIImage(named: HouseImageMapper.mapHouseImage(houseSlug: data.houseSlug))
    }
    
}
