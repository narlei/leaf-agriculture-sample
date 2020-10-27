//
//  OperationListPresenter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

class OperationListPresenter {
    // MARK: Properties

    weak var view: OperationListView?
    var router: OperationListWireframe?
    var interactor: OperationListUseCase?
    var userId: String?
    var fieldId: String?
}

extension OperationListPresenter: OperationListPresentation {
    func loadOperations() {
        guard let id = fieldId, let user = userId else {
            view?.showMessage(message: "The data does not contain all informations!")
            return
        }

        view?.showLoading()
        interactor?.loadOperations(fieldId: id, userId: user)
    }
    
    func open(operation: Operation) {
        guard let id = operation.id else {
            view?.showMessage(message: "The data does not contain all informations!")
            return
        }
        router?.openMap(operationId: id)
    }
}

extension OperationListPresenter: OperationListInteractorOutput {
    func didSuccessList(operations: [Operation]?) {
        view?.hideLoading()
        view?.load(operations: operations)
    }

    func didFailureList(message: String) {
        view?.hideLoading()
        view?.showMessage(message: message)
    }
}
