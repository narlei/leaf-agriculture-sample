//
//	YieldVolume.swift
//
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class YieldVolume: NSObject, Mappable {
    var average: Float?
    var max: Float?
    var min: Float?
    var standardDeviation: Double?

    class func newInstance(map: Map) -> Mappable? {
        return YieldVolume()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        average <- map["average"]
        max <- map["max"]
        min <- map["min"]
        standardDeviation <- map["standardDeviation"]
    }
}
