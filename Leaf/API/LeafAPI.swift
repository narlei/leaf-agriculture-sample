//
//  LeafAPI.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation
import Moya

public final class LeafAPI {
    static let baseURL = URL(string: Enviroment.api.baseUrl)!

    public var fields: MoyaProvider<LeafFieldsService> {
        return createProvider(for: LeafFieldsService.self)
    }
    
    public var operations: MoyaProvider<LeafOperationService> {
        return createProvider(for: LeafOperationService.self)
    }

    public var auth: MoyaProvider<LeafAuthService> {
        return createProvider(for: LeafAuthService.self)
    }

    private func createProvider<T: LeafAPIType>(for target: T.Type) -> MoyaProvider<T> {
        let endpointClosure = createEndpointClosure(for: target)

        var plugins = [PluginType]()

        #if DEBUG
            let pligin = NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { _, array in
                print(array)
            }, logOptions: .verbose))
            plugins.append(pligin)
        #endif

        return MoyaProvider<T>(endpointClosure: endpointClosure, plugins: plugins)
    }

    private func createEndpointClosure<T: TargetType>(for target: T.Type) -> MoyaProvider<T>.EndpointClosure {
        let endpointClosure = { (target: T) -> Endpoint in
            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return endpoint
        }

        return endpointClosure
    }
}
