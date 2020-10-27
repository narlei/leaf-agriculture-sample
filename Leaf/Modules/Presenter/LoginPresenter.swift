//
//  LoginPresenter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

class LoginPresenter {
    // MARK: Properties

    weak var view: LoginView?
    var router: LoginWireframe?
    var interactor: LoginUseCase?
}

extension LoginPresenter: LoginPresentation {
    func authentication(user: String?, password: String?) {
        guard let user = user, !user.isEmpty, let password = password, !password.isEmpty else {
            view?.showMessage(message: "Fill all fields!")
            return
        }

        view?.showLoading()
        interactor?.authentication(user: user, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func didSuccessLogin(token: Token) {
        view?.hideLoading()
        if let id = token.idToken {
            UserDefaults.saveToken(token: id)
            router?.startApplication()
        } else {
            view?.showMessage(message: "An error occured while retrieve your information, please try again!")
        }
    }

    func didFailureLogin(message: String) {
        view?.showMessage(message: message)
    }
}
