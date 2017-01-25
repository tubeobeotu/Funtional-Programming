//
//  LoginFormViewModel.swift
//  LoginMVVM
//
//  Created by Tuuu on 1/24/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class LoginFormViewModel: LoginFormPresentable{

    internal var errors: [String] = []
    private weak var context: UIViewController?
    var delegate: LoginFormViewModelDelegate?
    
    init(controller: UIViewController) {
        context = controller
    }
    init() {
    }
    //MARK: Error Checking
    func cleanErrors() {
        errors.removeAll()
    }
    
    func checkEmailErrors(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let validator = NSPredicate(format: "SELF MATCHES %@", regex)
        let valid = validator.evaluate(with: email);
        
        if !valid {
            errors.append("Hãy điền đúng định dạng")
        }
        
        return valid
    }
    
    func checkPasswordErrors(password: String) -> Bool {
        let valid = !password.isEmpty && password.characters.count >= 6
        
        if !valid {
            errors.append("Mật khẩu phải trên 5 ký tự")
        }
        
        return valid
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
    var emailPlaceholder: String { return "techmaster@email.com" }
    var emailLeftView: UIView {
        return leftViewForTextField(image: UIImage(named: "icn-textfield-email"))
    }
    var emailLeftViewMode: UITextFieldViewMode { return .always }
    
    var textColor: UIColor { return UIColor.white }
    var placeholderTextColor: UIColor { return UIColor(white: 0.85, alpha: 1) }
    var borderStyle: UITextBorderStyle { return .none }
    var bottomBorderColor: UIColor { return UIColor.white }
    var bottomBorderWidth: CGFloat { return 1 }
}

//MARK: Password Presentable
extension LoginFormViewModel {
    var passwordPlaceholder: String { return "password" }
    var passwordLeftView: UIView {
        return leftViewForTextField(image: UIImage(named: "icn-textfield-password"))
    }
    var passwordLeftViewMode: UITextFieldViewMode { return .always }
}

//MARK: Login Button Presentable
extension LoginFormViewModel
{
    var btn_bgColor: UIColor{ return UIColor(colorLiteralRed: 248, green: 55, blue: 102, alpha: 1)}
    var btn_textColor: UIColor{ return UIColor.white}
}

//MARK: Login Button Action
extension LoginFormViewModel {
    
    func login(email: String, password: String) {
        cleanErrors()
        
        let validEmail = checkEmailErrors(email: email)
        let validPassword = checkPasswordErrors(password: password)
        
        if !validEmail || !validPassword {
            self.delegate?.showErrors!(errors: self.errors)
            return
        }
        
        //login progress
    }

}
