//
//  HomeBuilder.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation
import UIKit

class HomeBuilder{
    
    static func build() -> UIViewController{
        let vc = HomeViewController()
        let presenter = HomePresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    
}
