//
//  LoginViewController.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation
import UIKit

class LoginViewController: BaseViewController {
    // MARK: Properties

    @IBOutlet var textFieldUser: UITextField!
    @IBOutlet var textFieldPassword: UITextField!

    var presenter: LoginPresentation?

    @IBAction func actionButtonLogin(_ sender: Any) {
        presenter?.authentication(user: textFieldUser.text, password: textFieldPassword.text)
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldUser.becomeFirstResponder()
    }
}

extension LoginViewController: LoginView {
    
}
