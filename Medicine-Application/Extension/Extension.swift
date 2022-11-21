//
//  Color.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation
import UIKit

class Color {
    
    static let customDarkBlue = UIColor(red: 4/255, green: 11/255, blue: 37/255, alpha: 1)
    static let customGreen = UIColor(red: 91/255, green: 200/255, blue: 93/255, alpha: 1)
}


class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
