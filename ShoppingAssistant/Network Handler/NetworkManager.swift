//
//  NetworkManager.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 15/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import Alamofire
class NetworkManager: NSObject {
    
    //GET
    class func getDataFromUrl(url: String, parameters: [String : String], completionHandler: @escaping (Data?, Error?) -> Void) {
        if (NetworkReachabilityManager()?.isReachable)! {
            Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: ["Accept-Encoding":"gzip"]).responseJSON {
                response in
                
                DLog(message: "#~#~GET Request : \(String(describing: response.request)) ~#~#")
                
                switch response.result {
                case .success(let data):
                    print("Success")
                    if let result = response.data {
                        let jsonData = result
                        DLog(message: "GET Json Data : \(jsonData)")
                        completionHandler(jsonData, nil)
                    }
//                    if (data as? NSDictionary) != nil {
//                        if let result = response.data {
////                            guard let jsonData = result else {return}
//                            let jsonData = result
//                            DLog(message: "GET jsonData Data : \(String(describing: jsonData))")
//                            DLog(message: "GET response Data : \(String(describing: response))")
//                            DLog(message: "GET onse.da Data : \(String(describing: response.data))")
////                            DLog(message: "GET ata as! Dat Data : \(String(describing: data as! Data))")
//                            completionHandler(response.data, nil)
//                        }
//                    }
                    
//                    completionHandler(data as? Data, nil)
                    
                case .failure(let error):
                    print("failure")
                    completionHandler(nil, error)
                }
            }
        }
        else {
            print("No Internet connection")
        }
    }
    
    
    
    /////////GET DICT
    class func getDictResponseFromUrl(url: String, parameters: [String : String], completionHandler: @escaping (Dictionary<String, Any>?, Error?) -> Void) {
        if (NetworkReachabilityManager()?.isReachable)! {
            Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: ["Accept-Encoding":"gzip"]).responseJSON {
                response in
                
                DLog(message: "#~#~GET Dict Request : \(String(describing: response.request)) ~#~#")
                
                switch response.result {
                case .success(let data):
                    print("Success")
                    if (data as? NSDictionary) != nil {
                        if let result = response.data {
                            let jsonData = result
                            DLog(message: "GET Json Data : \(jsonData)")
                            completionHandler(data as? Dictionary<String, Any>, nil)
                        }
                    }
                    //completionHandler(data as? Data, nil)
                    
                case .failure(let error):
                    print("failure")
                    completionHandler(nil, error)
                }
            }
        }
        else {
            print("No Internet connection")
        }
    }
}

