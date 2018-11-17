//
//  SearchedItemTableViewCell.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 16/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import Kingfisher

class SearchedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(prodModel: ProductData) {
        let url = URL(string: prodModel.product_image ?? "")
        prodImageView.kf.setImage(with: url!)
        
        nameLabel.text = prodModel.product_title ?? ""
        rating.text = "\(prodModel.product_rating ?? 0)"
        priceLabel.text = "\(prodModel.product_lowest_price ?? 0)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
