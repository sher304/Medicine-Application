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
    func getUserData(email: String?, password: String?)
    
}


class LoginPresenter: LoginPresenterDelegate{
    
    weak var view: LoginVCDelegate?
    
    func viewDidLoad(){
        
    }
    
    let userData = UserModel.userData
    
    func getUserData(email: String?, password: String?){
        userData.forEach { data in
            if data.username == email && data.password == password{
                print("Welcome!")
            }else{
                print("Incorrect data!")
            }
        }
    }
    
    required init(view: LoginVCDelegate) {
        self.view = view
    }
    
}
