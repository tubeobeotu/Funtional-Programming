//
//  UITextField.swift
//  mvvm-sample
//
//  Created by Fernando Martinez on 5/4/16.
//  Copyright © 2016 fernandodev. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder(withColor color:UIColor, borderWidth width: CGFloat) {
        let border = CALayer()

        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,
                              width: self.frame.size.width, height: self.frame.size.height)

        border.borderWidth = width

        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
