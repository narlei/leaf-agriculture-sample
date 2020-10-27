//
//  DMLeafFieldsServiceService.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Moya

public enum LeafFieldsService {
    case list
    case getOperations(userId: String, fieldId: String)
}

extension LeafFieldsService: LeafAPIType {
    public var path: String {
        switch self {
        case .list:
            return "services/fields/api/fields"
        case let .getOperations(userId, fieldId):
            return "services/fields/api/users/\(userId)/fields/\(fieldId)/operations"
        }
    }
}
