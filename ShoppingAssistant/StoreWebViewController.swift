//
//  StoreWebViewController.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 19/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import WebKit

class StoreWebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    var storeUrl = ""
    var storeName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let yourBackImage = UIImage(named: "back.png")
//        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
////        self.navigationController?.navigationBar.backItem?.title = ""
//        let BarButtonItemAppearance = UIBarButtonItem.appearance()
//        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
        
        title = storeName
        // Do any additional setup after loading the view, typically from a nib.
        
        let myURL = URL(string: storeUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
