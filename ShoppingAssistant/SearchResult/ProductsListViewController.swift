//
//  ProductsListViewController.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 15/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

var productName = ""

class ProductsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var productListDataModel : ProductListDataModel?
    var prodName = ""
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.type = .ballClipRotate
        loadingView.color = UIColor.orange
        listTableView.isHidden = true
        
//        NVActivityIndicatorView(frame: CGRect(x: view.frame.size.width/2 - 15, y: view.frame.size.height/2 - 15, width: 30, height: 30), type: .audioEqualizer, color: UIColor.orange, padding: 1.0)
        getAllProducts()
        // Do any additional setup after loading the view.
    }

    func getAllProducts() {
        let getProdListUrl = "https://price-api.datayuge.com/api/v1/compare/search?product=\(prodName)&api_key=\(API_KEY)"
        loadingView.startAnimating()
        NetworkManager.getDictResponseFromUrl(url: getProdListUrl, parameters: [:], completionHandler: {
            [weak self]
            (response, error) in
            
            if (error == nil) {
                
                if let responseDict = response {
                    print("Response data = \(responseDict)")
                    self?.productListDataModel = ProductListDataModel(dictionary: responseDict as NSDictionary)
                    DispatchQueue.main.async {
                        [weak self] in
                        self?.loadingView.stopAnimating()
                        self?.listTableView.reloadData()
                        self?.listTableView.isHidden = false
                    }
                }
            }
            else {
                self?.loadingView.stopAnimating()
            }
        })
    }
    
    
    //Mark: TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListDataModel?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "SearchedItemTableViewCellId") as! SearchedItemTableViewCell
        cell.setupUI(prodModel: (productListDataModel?.data![indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prodDetailsVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewControllerId") as! ProductDetailsViewController
        prodDetailsVC.productId = productListDataModel?.data?[indexPath.row].product_id ?? ""
        prodDetailsVC.lowestPrice = productListDataModel?.data?[indexPath.row].product_lowest_price
        prodDetailsVC.productName = productListDataModel?.data?[indexPath.row].product_title ?? ""
        navigationController?.show(prodDetailsVC, sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
