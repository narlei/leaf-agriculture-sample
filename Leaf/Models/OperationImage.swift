//
//  OperationImage.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class OperationImage: NSObject, Mappable {
    var property: String?
    var url: String?

    class func newInstance(map: Map) -> Mappable? {
        return OperationImage()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        property <- map["property"]
        url <- map["url"]
    }
}
