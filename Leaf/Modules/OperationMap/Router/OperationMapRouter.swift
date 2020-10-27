//
//  OperationMapRouter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//  
//

import Foundation
import UIKit

class OperationMapRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(operationId: String) -> OperationMapViewController {
        let viewController: OperationMapViewController = OperationMapViewController.getModule()
        let presenter = OperationMapPresenter()
        let router = OperationMapRouter()
        let interactor = OperationMapInteractor()

        presenter.operationId = operationId
        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension OperationMapRouter: OperationMapWireframe {
    // TODO: Implement wireframe methods
}
