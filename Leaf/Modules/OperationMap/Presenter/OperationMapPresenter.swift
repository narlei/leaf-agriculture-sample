//
//  OperationMapPresenter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

class OperationMapPresenter {
    // MARK: Properties

    weak var view: OperationMapView?
    var router: OperationMapWireframe?
    var interactor: OperationMapUseCase?
    var operationId: String?
    var operationFile: OperationFile?
}

extension OperationMapPresenter: OperationMapPresentation {
    func loadData() {
        guard let id = operationId else {
            view?.showMessage(message: "The data does not contain all informations!")
            return
        }

        view?.showLoading()
        interactor?.loadOperation(id: id)
    }
}

extension OperationMapPresenter: OperationMapInteractorOutput {
    func didSuccess(operation: OperationFile?) {
        operationFile = operation
        view?.set(operationFile: operation)
        interactor?.loadImages(id: operationId!)
    }

    func didFailureLoad(message: String) {
        view?.hideLoading()
        view?.showMessage(message: message)
    }

    func didSuccess(images: [OperationImage]?) {
        view?.hideLoading()
        view?.load(images: images)
    }
}
