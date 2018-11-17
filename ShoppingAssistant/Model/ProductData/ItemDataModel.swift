/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ItemDataModel {
	public var product_name : String?
	public var product_model : String?
//    public var product_brand : String?
	public var product_id : String?
//    public var product_ratings : String?
	public var product_mrp : String?
	public var product_category : String?
	public var product_sub_category : String?
	public var is_available : Bool?
	public var available_colors : Array<String>?
	public var product_images : Array<String>?
	public var is_comparable : Bool?
	public var spec_available : Bool?
	public var review_available : Bool?
	public var stores : Array<StoresModel>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let data_list = Data.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Data Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ItemDataModel]
    {
        var models:[ItemDataModel] = []
        for item in array
        {
            models.append(ItemDataModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let data = Data(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Data Instance.
*/
	required public init?(dictionary: NSDictionary) {

		product_name = dictionary["product_name"] as? String
		product_model = dictionary["product_model"] as? String
//        product_brand = dictionary["product_brand"] as? String
		product_id = dictionary["product_id"] as? String
//        product_ratings = dictionary["product_ratings"] as? String
		product_mrp = dictionary["product_mrp"] as? String
		product_category = dictionary["product_category"] as? String
		product_sub_category = dictionary["product_sub_category"] as? String
		is_available = dictionary["is_available"] as? Bool
//        if (dictionary["available_colors"] != nil) { available_colors = Available_colors.modelsFromDictionaryArray(dictionary["available_colors"] as! NSArray) }
//        if (dictionary["product_images"] != nil) { product_images = Product_images.modelsFromDictionaryArray(dictionary["product_images"] as! NSArray) }
		is_comparable = dictionary["is_comparable"] as? Bool
		spec_available = dictionary["spec_available"] as? Bool
		review_available = dictionary["review_available"] as? Bool
        if (dictionary["stores"] != nil) { stores = StoresModel.modelsFromDictionaryArray(array: dictionary["stores"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.product_name, forKey: "product_name")
		dictionary.setValue(self.product_model, forKey: "product_model")
//        dictionary.setValue(self.product_brand, forKey: "product_brand")
		dictionary.setValue(self.product_id, forKey: "product_id")
//        dictionary.setValue(self.product_ratings, forKey: "product_ratings")
		dictionary.setValue(self.product_mrp, forKey: "product_mrp")
		dictionary.setValue(self.product_category, forKey: "product_category")
		dictionary.setValue(self.product_sub_category, forKey: "product_sub_category")
		dictionary.setValue(self.is_available, forKey: "is_available")
		dictionary.setValue(self.is_comparable, forKey: "is_comparable")
		dictionary.setValue(self.spec_available, forKey: "spec_available")
		dictionary.setValue(self.review_available, forKey: "review_available")

		return dictionary
	}

}
