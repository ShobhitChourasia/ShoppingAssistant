//
//  ProductDetailsViewController.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 18/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ProductDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    var productId = ""
    var productDeatilsModel: ProductDetailsDataModel?
    var lowestPrice: Int?
    var productName = ""
    
    @IBOutlet weak var storeListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let yourBackImage = UIImage(named: "back.png")
//        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
////        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
//        navigationController?.navigationBar.backItem?.title = ""
////        if (productDeatilsModel?.data?.is_available ?? true) {
//            let BarButtonItemAppearance = UIBarButtonItem.appearance()
//            BarButtonItemAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
        
            title = productName.uppercased()
            loadingView.type = .ballClipRotate
            loadingView.color = UIColor.orange
            storeListTableView.isHidden = true
            
            getProductDetails()
//        }
//        else {
//            // create the alert
//            let alert = UIAlertController(title: "Oops!", message: "DataYuge is not able to fetch the data at this time, please try agai later.", preferredStyle: UIAlertController.Style.alert)
//
//            // add an action (button)
//            alert.addAction(UIAlertAction(title: "Go Back", style: UIAlertAction.Style.default, handler: { (action) -> Void in
//                self.goBack()
//            }))
//
//            // show the alert
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }

    func getProductDetails() {
        let getProdDetailsUrl = "https://price-api.datayuge.com/api/v1/compare/detail?api_key=V0wcRy0SYsCOiodZ7US2zFIcjUnbCIeyCnu&id=\(productId)"
        loadingView.startAnimating()
        NetworkManager.getDictResponseFromUrl(url: getProdDetailsUrl, parameters: [:], completionHandler: {
            [weak self]
            (response, error) in
            
            if (error == nil) {
                
                if let responseDict = response {
                    print("Response data = \(responseDict)")
                    self?.productDeatilsModel = ProductDetailsDataModel(dictionary: responseDict as NSDictionary)
                    
                    print("Store count = \(String(describing: self?.productDeatilsModel?.data?.stores?.count))")

                    DispatchQueue.main.async {
                        [weak self] in
//                        self?.storeListTableView.isHidden = false
//                        self?.storeListTableView.reloadData()
                        self?.loadingView.stopAnimating()
                        self?.checkForAvailability()
                    }
                }
            }
            else {
                self?.loadingView.stopAnimating()
            }
        })
    }
    
    func checkForAvailability() {
        if !(productDeatilsModel?.data?.is_available ?? true) {
        // create the alert
        let alert = UIAlertController(title: "Oops!", message: "DataYuge is not able to fetch the data at this time, please try agai later.", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Go Back", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            self.goBack()
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        }
        else {
            storeListTableView.isHidden = false
            storeListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDeatilsModel?.data?.stores?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailTableViewCellId") as! ItemDetailTableViewCell
        cell.setupUI(storeData: (productDeatilsModel?.data?.stores?[indexPath.row].amazon) ?? StoreDataModel(dictionary: [:])!)
        
        if (Int((productDeatilsModel?.data?.stores?[indexPath.row].amazon?.product_price ?? "0")) == (lowestPrice ?? 0)) {
            cell.thumbsupImageView.isHidden = false
        }
        else {
            cell.thumbsupImageView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storeWebVC = storyboard?.instantiateViewController(withIdentifier: "StoreWebViewControllerId") as! StoreWebViewController
        storeWebVC.storeUrl = productDeatilsModel?.data?.stores?[indexPath.row].amazon?.product_store_url ?? ""
        storeWebVC.storeName = productDeatilsModel?.data?.stores?[indexPath.row].amazon?.product_store ?? ""
        if (productDeatilsModel?.data?.stores?[indexPath.row].amazon?.product_store_url) != nil {
            navigationController?.show(storeWebVC, sender: self)
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
