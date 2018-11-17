//
//  ItemDetailTableViewCell.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 19/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import Kingfisher

class ItemDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thumbsupImageView: UIImageView!
    @IBOutlet weak var offerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(storeData: StoreDataModel) {
        
        if (storeData.product_store_url != nil) {
            let url = URL(string: storeData.product_store_logo ?? "")
            storeImageView.kf.setImage(with: url!)
            
            priceLabel.text = storeData.product_price
            offerLabel.text = storeData.product_offer ?? "Flat 10% using HDFC Visa cards"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
