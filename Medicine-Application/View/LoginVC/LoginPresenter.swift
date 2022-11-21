//
//  LoginPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation


protocol LoginPresenterDelegate{
    
    init(view: LoginVCDelegate)
    func viewDidLoad()
    
}


class LoginPresenter: LoginPresenterDelegate{
    
    weak var view: LoginVCDelegate?
    
    func viewDidLoad(){
        view?.check(message: "Greeting From Poland!")
    }
    
    required init(view: LoginVCDelegate) {
        self.view = view
    }
    
}
