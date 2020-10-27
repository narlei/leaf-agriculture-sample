//
//  LoginRouter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation
import UIKit

class LoginRouter {
    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> LoginViewController {
        let viewController: LoginViewController = LoginViewController.getModule()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension LoginRouter: LoginWireframe {
    func startApplication() {
        let viewFieldList = FieldListRouter.setupModule()
        UIViewController.replaceRootViewController(viewController: viewFieldList)
    }
}
