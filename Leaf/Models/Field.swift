//
//  Field.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class Field: NSObject, Mappable {
    var geometry: Geometry?
    var id: String?
    var leafUserId: String?
    var type: String?

    class func newInstance(map: Map) -> Mappable? {
        return Field()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        geometry <- map["geometry"]
        id <- map["id"]
        leafUserId <- map["leafUserId"]
        type <- map["type"]
    }
}
