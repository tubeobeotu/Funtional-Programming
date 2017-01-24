//
//  LoginButtonPresentable.swift
//  LoginMVVM
//
//  Created by Tuuu on 1/24/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation
protocol LoginButtonPresentable {
    
}
protocol LoginButtonDelegate {
    func login(email: String, password: String)
}
