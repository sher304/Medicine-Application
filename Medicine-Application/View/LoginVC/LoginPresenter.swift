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
    var homePresenter: HomePresenterDelegate?
    
    func viewDidLoad(){
        
    }
    
    let userData = UserModel.userData
    let userDefaults = UserDefaults.standard
    
    func getUserData(email: String?, password: String?){
        if let savedPerson = userDefaults.object(forKey: "userData") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(UserModel.self, from: savedPerson) {
                if loadedPerson.username == email && loadedPerson.password == password{
                    DispatchQueue.main.async {
                        guard let username = loadedPerson.username else { return }
                        guard let isDoctor = loadedPerson.isDoc else { return }
                        guard let isNurse = loadedPerson.isNurse else { return }
                        self.homePresenter?.getUsername(username: username, isNurse: isNurse, isDoctor: isDoctor)
                        print(username)
                        print(isNurse)
                        print(isDoctor)
                        print("++-----+++")
                    }
                    view?.openHomeVC(validated: true)
                }else{
                    view?.openHomeVC(validated: false)
                }
            }
        }
    }
    
    required init(view: LoginVCDelegate) {
        self.view = view
    }
    
}
