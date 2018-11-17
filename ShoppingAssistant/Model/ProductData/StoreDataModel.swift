/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class StoreDataModel {
	public var product_store : String?
	public var product_store_logo : String?
	public var product_store_url : String?
	public var product_price : String?
	public var product_mrp : String?
	public var product_offer : String?
	public var product_color : String?
	public var product_delivery : String?
	public var product_delivery_cost : String?
//    public var is_emi : String?
//    public var is_cod : String?
	public var return_time : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let amazon_list = Amazon.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Amazon Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [StoreDataModel]
    {
        var models:[StoreDataModel] = []
        for item in array
        {
            models.append(StoreDataModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let amazon = Amazon(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Amazon Instance.
*/
	required public init?(dictionary: NSDictionary) {

		product_store = dictionary["product_store"] as? String
		product_store_logo = dictionary["product_store_logo"] as? String
		product_store_url = dictionary["product_store_url"] as? String
		product_price = dictionary["product_price"] as? String
		product_mrp = dictionary["product_mrp"] as? String
		product_offer = dictionary["product_offer"] as? String
		product_color = dictionary["product_color"] as? String
		product_delivery = dictionary["product_delivery"] as? String
		product_delivery_cost = dictionary["product_delivery_cost"] as? String
//        is_emi = dictionary["is_emi"] as? String
//        is_cod = dictionary["is_cod"] as? String
		return_time = dictionary["return_time"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.product_store, forKey: "product_store")
		dictionary.setValue(self.product_store_logo, forKey: "product_store_logo")
		dictionary.setValue(self.product_store_url, forKey: "product_store_url")
		dictionary.setValue(self.product_price, forKey: "product_price")
		dictionary.setValue(self.product_mrp, forKey: "product_mrp")
		dictionary.setValue(self.product_offer, forKey: "product_offer")
		dictionary.setValue(self.product_color, forKey: "product_color")
		dictionary.setValue(self.product_delivery, forKey: "product_delivery")
		dictionary.setValue(self.product_delivery_cost, forKey: "product_delivery_cost")
//        dictionary.setValue(self.is_emi, forKey: "is_emi")
//        dictionary.setValue(self.is_cod, forKey: "is_cod")
		dictionary.setValue(self.return_time, forKey: "return_time")

		return dictionary
	}

}
