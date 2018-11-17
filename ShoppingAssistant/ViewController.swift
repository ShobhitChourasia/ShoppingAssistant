//
//  ViewController.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 14/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func getProductDataButtonTapped(_ sender: Any) {
        
        let prodListVC = storyboard?.instantiateViewController(withIdentifier: "ProductsListViewControllerId") as! ProductsListViewController
        
        navigationController?.show(prodListVC, sender: self)
    }
}

