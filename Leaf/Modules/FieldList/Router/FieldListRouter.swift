//
//  FieldListRouter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation
import UIKit

class FieldListRouter {
    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> UINavigationController {
        let viewController: FieldListViewController = FieldListViewController.getModule()
        let presenter = FieldListPresenter()
        let router = FieldListRouter()
        let interactor = FieldListInteractor()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        let navigation = UINavigationController(rootViewController: viewController)
        return navigation
    }
}

extension FieldListRouter: FieldListWireframe {
    func openOperationList(fieldId: String, userId: String) {
        let viewOperation = OperationListRouter.setupModule(fieldId: fieldId, userId: userId)
        view?.navigationController?.pushViewController(viewOperation, animated: true)
    }
}
