//
//  OperationMapInteractor.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

class OperationMapInteractor {
    // MARK: Properties

    weak var output: OperationMapInteractorOutput?
    var api = LeafAPI()
}

extension OperationMapInteractor: OperationMapUseCase {
    func loadOperation(id: String) {
        api.operations.request(.getFile(operationId: id)) { result in
            switch result {
            case let .success(response):
                if response.isSuccessRequest(), let operation = response.mapObject(object: OperationFile.self) {
                    self.output?.didSuccess(operation: operation)
                } else {
                    self.output?.didFailureLoad(message: "An error occured while retrieve your information, please try again!")
                }
            case let .failure(error):
                self.output?.didFailureLoad(message: error.localizedDescription)
            }
        }
    }
    
    func loadImages(id: String) {
        api.operations.request(.getImages(operationId: id)) { (result) in
            switch result {
            case let .success(response):
                if response.isSuccessRequest(), let images = response.mapArray(object: OperationImage.self) {
                    self.output?.didSuccess(images: images)
                } else {
                    self.output?.didFailureLoad(message: "An error occured while retrieve your information, please try again!")
                }
            case let .failure(error):
                self.output?.didFailureLoad(message: error.localizedDescription)
            }
        }
    }
}
