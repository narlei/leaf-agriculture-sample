//
//  OperationListInteractor.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//  
//

import Foundation

class OperationListInteractor {

    // MARK: Properties

    weak var output: OperationListInteractorOutput?
    var api = LeafAPI()
}

extension OperationListInteractor: OperationListUseCase {
    func loadOperations(fieldId: String, userId: String) {
        api.fields.request(.getOperations(userId: userId, fieldId: fieldId)) { (result) in
            switch result {
            case let .success(response):
                if response.isSuccessRequest(), let operations = response.mapArray(object: Operation.self) {
                    self.output?.didSuccessList(operations: operations)
                } else {
                    self.output?.didFailureList(message: "An error occured while retrieve your information, please try again!")
                }
            case let .failure(error):
                self.output?.didFailureList(message: error.localizedDescription)
            }
        }
    }
}
