//
//  OperationMapContract.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

protocol OperationMapView: BaseViewProtocol {
    func load(images: [OperationImage]?)
    func set(operationFile: OperationFile?)
}

protocol OperationMapPresentation: class {
    func loadData()
}

protocol OperationMapUseCase: class {
    func loadOperation(id: String)
    func loadImages(id: String)
}

protocol OperationMapInteractorOutput: class {
    func didSuccess(operation: OperationFile?)
    func didSuccess(images: [OperationImage]?)
    func didFailureLoad(message: String)
}

protocol OperationMapWireframe: class {
    // TODO: Declare wireframe methods
}
