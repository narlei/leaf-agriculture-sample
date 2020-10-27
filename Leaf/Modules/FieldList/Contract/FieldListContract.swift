//
//  FieldListContract.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//  
//

import Foundation

protocol FieldListView: BaseViewProtocol {
    func load(fields: [Field]?)
}

protocol FieldListPresentation: class {
    func loadFields()
    func openField(field: Field)
}

protocol FieldListUseCase: class {
    func loadFields()
}

protocol FieldListInteractorOutput: class {
    func didSuccessList(fields: [Field]?)
    func didFailureList(message: String)
}

protocol FieldListWireframe: class {
    func openOperationList(fieldId: String, userId: String)
}
