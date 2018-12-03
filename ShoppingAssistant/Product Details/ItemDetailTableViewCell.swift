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
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var deliveryDays: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(storeData: StoreDataModel) {
        
        if (storeData.product_store_url != nil) {
            let url = URL(string: storeData.product_store_logo ?? "")
            storeImageView.kf.setImage(with: url!)
            
//            priceLabel.text = storeData.product_price
            offerLabel.text = storeData.product_offer == "" ? "Flat 10% using HDFC Visa cards" : storeData.product_offer
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.maximumFractionDigits = 0
            numberFormatter.locale = Locale(identifier: "en_IN")
            let price = numberFormatter.string(from: Int(storeData.product_price ?? "0")! as NSNumber)
            priceLabel.text = price!
            
            if (storeData.product_mrp == "0" || storeData.product_mrp == "" || storeData.product_mrp == " ") {
               actualPriceLabel.isHidden = true
            }
            else {
                actualPriceLabel.isHidden = false
            let actualPrice = numberFormatter.string(from: Int(storeData.product_mrp ?? "0")! as NSNumber)
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: actualPrice ?? "0")
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            actualPriceLabel.attributedText = attributeString
            }
            if let prodDelivery = storeData.product_delivery {
                deliveryDays.text = prodDelivery + " days"
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
