//
//  LoginBuilder.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation
import UIKit

class LoginBuilder{
    
    static func build() -> UIViewController{
        let vc = LoginViewController()
        let presenter = LoginPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}
