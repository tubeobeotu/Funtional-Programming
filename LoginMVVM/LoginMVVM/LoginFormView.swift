//
//  LoginFormView.swift
//  LoginMVVM
//
//  Created by Tuuu on 1/24/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation
import UIKit

typealias LoginFormPresentable = LoginButtonPresentable & LoginPasswordPresentable & LoginTextFieldPresentable

class LoginFormView: UIView, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var presenter: LoginFormPresentable?
    var delegate: LoginButtonDelegate?
    func configure(withPresenter presenter: LoginFormPresentable) {
        self.presenter = presenter
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: presenter.emailPlaceholder, attributes: [NSForegroundColorAttributeName: presenter.placeholderTextColor])
        
        emailTextField.borderStyle = presenter.borderStyle
        emailTextField.textColor = presenter.textColor
        emailTextField.leftView = presenter.emailLeftView
        emailTextField.leftViewMode = presenter.emailLeftViewMode
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: presenter.passwordPlaceholder, attributes: [NSForegroundColorAttributeName: presenter.placeholderTextColor])
        
        passwordTextField.borderStyle = presenter.borderStyle
        passwordTextField.textColor = presenter.textColor
        passwordTextField.leftView = presenter.passwordLeftView
        passwordTextField.leftViewMode = presenter.passwordLeftViewMode
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let color = self.presenter?.bottomBorderColor, let width = self.presenter?.bottomBorderWidth {
            emailTextField.setBottomBorder(withColor: color, borderWidth: width)
            passwordTextField.setBottomBorder(withColor: color, borderWidth: width)
        }
    }
    
    @IBAction func loginDidTap(sender: UIButton) {
        doLogin()
    }
    
    func doLogin() {
        delegate?.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

//MARK: UITextFieldDelegate
extension LoginFormView {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let tag = textField.tag
        
        if(tag == emailTextField.tag) {
            passwordTextField.becomeFirstResponder()
        } else if(tag == passwordTextField.tag) {
            textField.resignFirstResponder()
            doLogin()
            return false
        }
        
        return true
    }
}
