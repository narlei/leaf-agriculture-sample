//
//  FieldListInteractor.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation

class FieldListInteractor {
    // MARK: Properties

    weak var output: FieldListInteractorOutput?
    var api = LeafAPI()
}

extension FieldListInteractor: FieldListUseCase {
    func loadFields() {
        api.fields.request(.list) { result in
            switch result {
            case let .success(response):
                if response.isSuccessRequest(), let fields = response.mapArray(object: Field.self) {
                    self.output?.didSuccessList(fields: fields)
                } else {
                    self.output?.didFailureList(message: "An error occured while retrieve your information, please try again!")
                }
            case let .failure(error):
                self.output?.didFailureList(message: error.localizedDescription)
            }
        }
    }
}
