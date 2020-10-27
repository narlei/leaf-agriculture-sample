//
//  DMLeafOperationService.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Moya

public enum LeafOperationService {
    case getFile(operationId: String)
    case getImages(operationId: String)
}

extension LeafOperationService: LeafAPIType {
    public var path: String {
        switch self {
        case let .getFile(operationId):
            return "services/operations/api/files/\(operationId)/summary"
        case let .getImages(operationId):
            return "services/operations/api/files/\(operationId)/images"
        }
    }
}
