//
//	Geometry.swift
//
//	Create by Narlei Moreira on 26/10/2020
//	Copyright © 2020 Delivery Much. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class Geometry: NSObject, Mappable {
    var coordinates: [[Double]]?
    var type: String?

    class func newInstance(map: Map) -> Mappable? {
        return Geometry()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        type <- map["type"]

        if let value = map["coordinates"].currentValue {
            coordinates = parseCoordinates(currentValue: value)
        }
    }

    private func parseCoordinates(currentValue: Any) -> [[Double]]? {
        if let coordinatesArray = currentValue as? [[Double]] {
            return coordinatesArray
        } else {
            if let floatArray = currentValue as? Array<Any>, let first = floatArray.first {
                return parseCoordinates(currentValue: first)
            }
        }
        return nil
    }
}
