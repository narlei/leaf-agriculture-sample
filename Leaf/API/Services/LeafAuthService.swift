//
//  DMDMLeafAuthService.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Moya

public enum LeafAuthService {
    case authenticate(user: String, password: String, rememberMe: Bool)
}

extension LeafAuthService: LeafAPIType {
    public var path: String {
        return "api/authenticate"
    }

    public var method: Moya.Method {
        return .post
    }

    public var task: Task {
        switch self {
        case let .authenticate(user, password, rememberMe):
            return .requestParameters(parameters: ["username": user, "password": password, "rememberMe": rememberMe], encoding: JSONEncoding.default)
        }
    }
}
