//
//	Elevation.swift
//
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation 
import ObjectMapper


class Elevation : NSObject, NSCoding, Mappable{

	var average : Float?
	var max : Float?
	var min : Float?
	var standardDeviation : Float?


	class func newInstance(map: Map) -> Mappable?{
		return Elevation()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		average <- map["average"]
		max <- map["max"]
		min <- map["min"]
		standardDeviation <- map["standardDeviation"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         average = aDecoder.decodeObject(forKey: "average") as? Float
         max = aDecoder.decodeObject(forKey: "max") as? Float
         min = aDecoder.decodeObject(forKey: "min") as? Float
         standardDeviation = aDecoder.decodeObject(forKey: "standardDeviation") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if average != nil{
			aCoder.encode(average, forKey: "average")
		}
		if max != nil{
			aCoder.encode(max, forKey: "max")
		}
		if min != nil{
			aCoder.encode(min, forKey: "min")
		}
		if standardDeviation != nil{
			aCoder.encode(standardDeviation, forKey: "standardDeviation")
		}

	}

}
