//
//  UserDefaultsExtension.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation

private enum Key {
    static let token = "token"
}

extension UserDefaults {
    static func saveToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: Key.token)
    }

    static func getToken() -> String? {
        return UserDefaults.standard.value(forKey: Key.token) as? String
    }
}
