/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class StoresModel {
	public var amazon : StoreDataModel?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let stores_list = Stores.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Stores Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [StoresModel]
    {
        var models:[StoresModel] = []
        for item in array
        {
            let arrayDict = item as! NSDictionary
            print("array dict = \(arrayDict)")
            print("array dict all keys = \(arrayDict.allKeys)")
            let storeModelDict = StoresModel(dictionary: item as! NSDictionary)!
            if (storeModelDict.amazon?.product_price != "" && storeModelDict.amazon?.product_price != nil) {
            models.append(storeModelDict)
            }
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let stores = Stores(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Stores Instance.
*/
	required public init?(dictionary: NSDictionary) {

        if (dictionary[dictionary.allKeys.first!] != nil) {
            if let dictArray = dictionary[dictionary.allKeys.first!] as? [String] {
                if (dictArray.count == 0) {
                return
                }
            }
            if dictionary.allKeys.count > 0 {
                amazon = StoreDataModel(dictionary: dictionary[dictionary.allKeys.first!] as! NSDictionary)
            }
        }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.amazon?.dictionaryRepresentation(), forKey: "amazon")

		return dictionary
	}

}
