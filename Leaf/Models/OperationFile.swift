//
//	OperationFile.swift
//
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class OperationFile: NSObject, Mappable {
    var geometry: Geometry?
    var properties: Property?
    var type: String?

    class func newInstance(map: Map) -> Mappable? {
        return OperationFile()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        geometry <- map["geometry"]
        properties <- map["properties"]
        type <- map["type"]
    }
    
    func getMaxLatitude() -> Double? {
        guard let coordinates = geometry?.coordinates else {
            return nil
        }

        let arrayLatitude = coordinates.map { (arrayDouble) -> Double in
            arrayDouble.last ?? 0
        }

        return arrayLatitude.max()
    }

    func getMinLatitude() -> Double? {
        guard let coordinates = geometry?.coordinates else {
            return nil
        }

        let arrayLatitude = coordinates.map { (arrayDouble) -> Double in
            arrayDouble.last ?? 0
        }

        return arrayLatitude.min()
    }

    func getMaxLongitude() -> Double? {
        guard let coordinates = geometry?.coordinates else {
            return nil
        }

        let arrayLatitude = coordinates.map { (arrayDouble) -> Double in
            arrayDouble.first ?? 0
        }

        return arrayLatitude.max()
    }

    func getMinLongitude() -> Double? {
        guard let coordinates = geometry?.coordinates else {
            return nil
        }

        let arrayLatitude = coordinates.map { (arrayDouble) -> Double in
            arrayDouble.first ?? 0
        }

        return arrayLatitude.min()
    }
}
