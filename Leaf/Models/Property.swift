//
//	Property.swift
//
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class Property: NSObject, Mappable {
    var crop: [String]?
    var elevation: Elevation?
    var operationType: String?
    var speed: Elevation?
    var totalArea: Float?
    var totalDistance: Float?
    var yieldVolume: YieldVolume?

    class func newInstance(map: Map) -> Mappable? {
        return Property()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        crop <- map["crop"]
        elevation <- map["elevation"]
        operationType <- map["operationType"]
        speed <- map["speed"]
        totalArea <- map["totalArea"]
        totalDistance <- map["totalDistance"]
        yieldVolume <- map["yieldVolume"]
    }
}
