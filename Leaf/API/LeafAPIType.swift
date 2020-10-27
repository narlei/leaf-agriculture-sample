//
//  LeafAPIType.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation

import Moya
import ObjectMapper

protocol LeafAPIType: TargetType {
}

extension LeafAPIType {
    public var baseURL: URL { return LeafAPI.baseURL }

    public var method: Moya.Method { return .get }

    public var task: Task { return .requestPlain }

    public var headers: [String: String]? {
        if let token = UserDefaults.getToken() {
            return ["Authorization": "Bearer \(token)",
                    "Content-Type": "application/json"]
        }

        return ["Content-Type": "application/json"]
    }

    public var sampleData: Data {
        let name = String(describing: type(of: self))
        return stubbedResponse(fileName: name)
    }

    func stubbedResponse(fileName: String) -> Data! {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: path!))
    }
}

extension Response {
    func mapObject<T: Mappable>(object: T.Type) -> T? {
        do {
            let dicJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let item = dicJson as? [String: Any] {
                return object.init(JSON: item)
            }
            return nil
        } catch {
            return nil
        }
    }

    func mapArray<T: Mappable>(object: T.Type) -> [T]? {
        do {
            let dicJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let results = dicJson as? [[String: Any]] {
                var arrayObjects = [T]()
                for item in results {
                    if let object = object.init(JSON: item) {
                        arrayObjects.append(object)
                    }
                }
                return arrayObjects
            }
            return nil
        } catch {
            return nil
        }
    }

    func isSuccessRequest() -> Bool {
        switch statusCode {
        case 200 ..< 400:
            return true
        default:
            return false
        }
    }
}
