//
//  LoginButtonPresentable.swift
//  LoginMVVM
//
//  Created by Tuuu on 1/24/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation
import UIKit

protocol LoginButtonPresentable {
    var btn_bgColor: UIColor{get}
    var btn_textColor: UIColor{get}
}
protocol LoginButtonAction
{
    func login(email: String, password: String)
}

@objc protocol LoginFormViewModelDelegate
{
    @objc optional func showErrors(errors: [String])
}
