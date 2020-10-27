//
//	GeoJson.swift
//
//	Create by Narlei Moreira on 26/10/2020
//	Copyright © 2020 Delivery Much. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Alamofire
import Foundation
import ObjectMapper

class GeoJson: NSObject, Mappable {
    var externalId: String?
    var geometry: Geometry?

    class func newInstance(map: Map) -> Mappable? {
        return GeoJson()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        externalId <- map["externalId"]
        geometry <- map["geometry"]
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

extension AFDataResponse {
    func mapArray<T: Mappable>(object: T.Type) -> [T]? {
        guard let data = data else {
            return nil
        }
        do {
            let dicJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let results = dicJson as? [[String: Any]] {
                var arrayObjects = [T]()
                for item in results {
                    if let object = object.init(JSON: item) {
                        arrayObjects.append(object)
                    }
                }
                return arrayObjects
            }
            return nil
        } catch {
            return nil
        }
    }
}
