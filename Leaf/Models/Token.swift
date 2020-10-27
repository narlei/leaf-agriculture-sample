//
//  Token.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class Token: NSObject, Mappable {
    var idToken: String?

    class func newInstance(map: Map) -> Mappable? {
        return Token()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        idToken <- map["id_token"]
    }
}
