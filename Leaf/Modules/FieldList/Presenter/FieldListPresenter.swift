//
//  FieldListPresenter.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

class FieldListPresenter {
    // MARK: Properties

    weak var view: FieldListView?
    var router: FieldListWireframe?
    var interactor: FieldListUseCase?
}

extension FieldListPresenter: FieldListPresentation {
    func loadFields() {
        view?.showLoading()
        interactor?.loadFields()
    }

    func openField(field: Field) {
        guard let id = field.id, let user = field.leafUserId else {
            view?.showMessage(message: "The data does not contain all informations!")
            return
        }
        router?.openOperationList(fieldId: id, userId: user)
    }
}

extension FieldListPresenter: FieldListInteractorOutput {
    func didSuccessList(fields: [Field]?) {
        view?.hideLoading()
        view?.load(fields: fields)
    }

    func didFailureList(message: String) {
        view?.showMessage(message: message)
    }
}
