//
//  PurchaseCell.swift
//  
//
//  Created by Joseph  DeMario on 4/25/20.
//

import UIKit

class PurchaseCell: UITableViewCell {

    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
