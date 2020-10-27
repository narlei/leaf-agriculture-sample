//
//  Operation.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class Operation: NSObject, Mappable {
    var crops: [String]?
    var id: String?
    var leafUserId: String?
    var operationType: String?
    var origin: String?
    var provider: String?
    var providerFileId: String?
    var varieties: [AnyObject]?

    class func newInstance(map: Map) -> Mappable? {
        return Operation()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        crops <- map["crops"]
        id <- map["id"]
        leafUserId <- map["leafUserId"]
        operationType <- map["operationType"]
        origin <- map["origin"]
        provider <- map["provider"]
        providerFileId <- map["providerFileId"]
        varieties <- map["varieties"]
    }
}
