//
//  LoginPasswordPresentable.swift
//  LoginMVVM
//
//  Created by Tuuu on 1/24/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit
protocol LoginPasswordPresentable{
    var passwordPlaceholder: String {get}
    var passwordLeftView: UIView {get}
    var passwordLeftViewMode: UITextFieldViewMode {get}
}
