//
//  LoginPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation
import FirebaseAuth

protocol LoginPresenterDelegate{
    
    init(view: LoginVCDelegate)
    func getUserData(email: String?, password: String?)
    
}


class LoginPresenter: LoginPresenterDelegate{
    
    weak var view: LoginVCDelegate?
    var homePresenter: HomePresenterDelegate?
    
    let userData = UserModel.userData
    let userDefaults = UserDefaults.standard
    
    func getUserData(email: String?, password: String?){
        signIn(email: email, password: password)
    }
    
    private func signIn(email: String?, password: String?){
        guard let email = email else {
            print("#1 LOgin Failed")
            self.view?.openHomeVC(validated: false)
            return }
        guard let password = password else {
            print("#2 LOgin Failed")
            self.view?.openHomeVC(validated: false)
            return }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.view?.openHomeVC(validated: false)
                print("#3 lo")
            }else {
                self.view?.openHomeVC(validated: true)
            }
        }
    }
    
    required init(view: LoginVCDelegate) {
        self.view = view
    }
    
}
