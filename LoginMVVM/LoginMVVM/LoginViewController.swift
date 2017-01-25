//
//  LoginViewController.swift
//  LoginMVVM
//
//  Created by Tuuu on 1/24/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginFormViewModelDelegate {
    @IBOutlet weak var loginFormView: LoginFormView!
    var loginViewModel: LoginFormViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    func setupViews()
    {
        loginViewModel = LoginFormViewModel(controller: self)
        loginViewModel?.delegate = self
        loginFormView.configure(withPresenter: loginViewModel!)
    }
    func showErrors(errors: [String]) {
        let message = errors.joined(separator: "\n")
        let errorAlert = UIAlertController(title: "Lỗi", message: message, preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "Đồng ý", style: .default, handler: nil))
        self.present(errorAlert, animated: true, completion: nil)
    }

}
