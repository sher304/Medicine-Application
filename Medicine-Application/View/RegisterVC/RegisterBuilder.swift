//
//  RegisterBuilder.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation
import UIKit

class RegisterBuilder {
    
    static func build() -> UIViewController{
        let vc = RegisterViewController()
        let presenter = RegisterPresenter(view: vc)
        vc.presenter = presenter
        return vc   
    }
}
