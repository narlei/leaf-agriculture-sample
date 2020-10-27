//
//  LoginInteractor.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

class LoginInteractor {
    // MARK: Properties

    weak var output: LoginInteractorOutput?
    var api = LeafAPI()
}

extension LoginInteractor: LoginUseCase {
    func authentication(user: String, password: String) {
        api.auth.request(.authenticate(user: user, password: password, rememberMe: true)) { result in
            switch result {
            case let .success(response):
                if response.isSuccessRequest(), let token = response.mapObject(object: Token.self) {
                    self.output?.didSuccessLogin(token: token)
                } else {
                    self.output?.didFailureLogin(message: "An error occured while retrieve your information, please try again!")
                }
            case let .failure(error):
                self.output?.didFailureLogin(message: error.localizedDescription)
            }
        }
    }
}
