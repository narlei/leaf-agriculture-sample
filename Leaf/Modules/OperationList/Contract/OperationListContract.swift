//
//  OperationListContract.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//  
//

import Foundation

protocol OperationListView: BaseViewProtocol {
    func load(operations: [Operation]?)
}

protocol OperationListPresentation: class {
    func loadOperations()
    func open(operation: Operation)
}

protocol OperationListUseCase: class {
    func loadOperations(fieldId: String, userId: String)
}

protocol OperationListInteractorOutput: class {
    func didSuccessList(operations: [Operation]?)
    func didFailureList(message: String)
}

protocol OperationListWireframe: class {
    func openMap(operationId: String)
}
