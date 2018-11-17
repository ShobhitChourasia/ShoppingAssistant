/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ProductData {
	public var product_title : String?
	public var can_compare : Bool?
	public var product_lowest_price : Int?
	public var product_link : String?
	public var product_id : String?
	public var product_category : String?
	public var product_sub_category : String?
	public var product_rating : Double?
	public var product_image : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let data_list = Data.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Data Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ProductData]
    {
        var models:[ProductData] = []
        for item in array
        {
            models.append(ProductData(dictionary: item as! NSDictionary)!)
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

		product_title = dictionary["product_title"] as? String
		can_compare = dictionary["can_compare"] as? Bool
		product_lowest_price = dictionary["product_lowest_price"] as? Int
		product_link = dictionary["product_link"] as? String
		product_id = dictionary["product_id"] as? String
		product_category = dictionary["product_category"] as? String
		product_sub_category = dictionary["product_sub_category"] as? String
		product_rating = dictionary["product_rating"] as? Double
		product_image = dictionary["product_image"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.product_title, forKey: "product_title")
		dictionary.setValue(self.can_compare, forKey: "can_compare")
		dictionary.setValue(self.product_lowest_price, forKey: "product_lowest_price")
		dictionary.setValue(self.product_link, forKey: "product_link")
		dictionary.setValue(self.product_id, forKey: "product_id")
		dictionary.setValue(self.product_category, forKey: "product_category")
		dictionary.setValue(self.product_sub_category, forKey: "product_sub_category")
		dictionary.setValue(self.product_rating, forKey: "product_rating")
		dictionary.setValue(self.product_image, forKey: "product_image")

		return dictionary
	}

}
