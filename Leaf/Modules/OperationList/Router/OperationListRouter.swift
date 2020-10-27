//
//  OperationListRouter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//  
//

import Foundation
import UIKit

class OperationListRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(fieldId: String, userId: String) -> OperationListViewController {
        let viewController: OperationListViewController = OperationListViewController.getModule()
        let presenter = OperationListPresenter()
        let router = OperationListRouter()
        let interactor = OperationListInteractor()

        presenter.userId = userId
        presenter.fieldId = fieldId
        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension OperationListRouter: OperationListWireframe {
    func openMap(operationId: String) {
        let mapView = OperationMapRouter.setupModule(operationId: operationId)
        view?.navigationController?.pushViewController(mapView, animated: true)
    }
}
