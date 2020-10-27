//
//  LoginContract.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

protocol LoginView: BaseViewProtocol {
}

protocol LoginPresentation: class {
    func authentication(user: String?, password: String?)
}

protocol LoginUseCase: class {
    func authentication(user: String, password: String)
}

protocol LoginInteractorOutput: class {
    func didSuccessLogin(token: Token)
    func didFailureLogin(message: String)
}

protocol LoginWireframe: class {
    func startApplication()
}
