//
//  RegisterPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation

protocol RegisterPresenterDelegate {
    
    init(view: RegisterVCDelegate?)
}

class RegisterPresenter: RegisterPresenterDelegate{
    
    weak var view: RegisterVCDelegate?
    
    required init(view: RegisterVCDelegate?) {
        self.view = view
    }
}
