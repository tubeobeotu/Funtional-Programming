//
//  LoginFormViewModel.swift
//  LoginMVVM
//
//  Created by Tuuu on 1/24/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

struct LoginFormViewModel: LoginFormPresentable {
    private var errors: [String] = []
    private weak var context: UIViewController?
    
    init(controller: UIViewController) {
        context = controller
    }
    
    //MARK: Error Checking
    mutating func cleanErrors() {
        errors.removeAll()
    }
    
    mutating func checkEmailErrors(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let validator = NSPredicate(format: "SELF MATCHES %@", regex)
        let valid = validator.evaluate(with: email);
        
        if !valid {
            errors.append("Este endereço de e-mail aparenta não ser válido")
        }
        
        return valid
    }
    
    mutating func checkPasswordErrors(password: String) -> Bool {
        let valid = !password.isEmpty && password.characters.count >= 6
        
        if !valid {
            errors.append("Sua senha precisa ter mais de 6 caracteres")
        }
        
        return valid
    }
    
    func showErrors() {
        let message = errors.joined(separator: "\n")
        let errorAlert = UIAlertController(title: "Erros", message: message, preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        context?.present(errorAlert, animated: true, completion: nil)
    }
    
    func leftViewForTextField(image: UIImage?) -> UIImageView {
        //5px as padding
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width:15 + 5, height:15))
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
}

//MARK: Email Presentable
extension LoginFormViewModel {
    var emailPlaceholder: String { return "seu@email.com" }
    var emailLeftView: UIView {
        return leftViewForTextField(image: UIImage(named: "icn-textfield-email"))
    }
    var emailLeftViewMode: UITextFieldViewMode { return .always }
}

//MARK: Password Presentable
extension LoginFormViewModel {
    var passwordPlaceholder: String { return "senha" }
    var passwordLeftView: UIView {
        return leftViewForTextField(image: UIImage(named: "icn-textfield-password"))
    }
    var passwordLeftViewMode: UITextFieldViewMode { return .always }
}

//MARK: Login Text Field Presentable
extension LoginFormViewModel {
    var textColor: UIColor { return UIColor.white }
    var placeholderTextColor: UIColor { return UIColor(white: 0.85, alpha: 1) }
    var borderStyle: UITextBorderStyle { return .none }
    var bottomBorderColor: UIColor { return UIColor.white }
    var bottomBorderWidth: CGFloat { return 1 }
}

//MARK: Login Button Presentable
extension LoginFormViewModel {
    
    mutating func login(email: String, password: String) {
        cleanErrors()
        
        let validEmail = checkEmailErrors(email: email)
        let validPassword = checkPasswordErrors(password: password)
        
        if !validEmail || !validPassword {
            showErrors()
            return
        }
        
        //login progress
    }

}
