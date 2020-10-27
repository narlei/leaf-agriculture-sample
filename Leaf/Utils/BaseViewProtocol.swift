//
//  BaseViewProtocol.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import Foundation

protocol BaseViewProtocol: class {
    func showLoading()
    func hideLoading()
    func showMessage(message: String)
}
