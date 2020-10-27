//
//  User.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import ObjectMapper

class User: NSObject, Mappable {
    var apiOwnerUsername: String?
    var email: String?
    var id: String?
    var name: String?

    class func newInstance(map: Map) -> Mappable? {
        return User()
    }

    required init?(map: Map) {}
    override private init() {}

    func mapping(map: Map) {
        apiOwnerUsername <- map["apiOwnerUsername"]
        email <- map["email"]
        id <- map["id"]
        name <- map["name"]
    }
}
