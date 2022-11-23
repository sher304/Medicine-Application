//
//  OnBoardBuilder.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 23/11/2022.
//

import Foundation
import UIKit

class OnBoardBuilder{
    
    static func build() -> UIViewController{
        let vc = OnBoardVC()
        let presenter = OnBoardPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}
