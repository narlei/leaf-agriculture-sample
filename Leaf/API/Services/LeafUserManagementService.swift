//
//  DMLeafUserManagementService.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Moya

public enum LeafUserManagementService {
    case list
}

extension LeafUserManagementService: LeafAPIType {
    public var path: String {
        return "services/usermanagement/api/users"
    }
}
