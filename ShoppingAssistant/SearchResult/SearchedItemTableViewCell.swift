//
//  SearchedItemTableViewCell.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 16/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class SearchedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(prodModel: ProductData) {
        let url = URL(string: prodModel.product_image ?? "")
        prodImageView.kf.setImage(with: url!)
        
        nameLabel.text = prodModel.product_title ?? ""
//        rating.text = "\(prodModel.product_rating ?? 0)"
        ratingView.rating = Double("\(prodModel.product_rating ?? 0)") ?? 0.0
        ratingView.settings.fillMode = .precise
        ratingView.text = "\(prodModel.product_rating ?? 0)"
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.locale = Locale(identifier: "en_IN")
        let price = numberFormatter.string(from: prodModel.product_lowest_price! as NSNumber)
        priceLabel.text = price!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
