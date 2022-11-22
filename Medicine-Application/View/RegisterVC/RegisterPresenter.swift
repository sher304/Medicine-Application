//
//  RegisterPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation

protocol RegisterPresenterDelegate {
    
    init(view: RegisterVCDelegate?)
    
    func viewDidLoad()
    
    func getData(userModel: UserModel?)
}

class RegisterPresenter: RegisterPresenterDelegate{
    
    weak var view: RegisterVCDelegate?
    
    let defaults = UserDefaults.standard
    
    func viewDidLoad(){
        
    }
    
    func getData(userModel: UserModel?){
        let password = userModel?.password
        let username = userModel?.username
        let name = userModel?.name
        let surname = userModel?.surname
        let userSet = UserModel(username: username, password: password, PESEL: Int.random(in: 1000...15000).description, name: name, surname: surname, isNurse: false, isDoc: false)
        
        // Retrieve from UserDefaults
        if let savedPerson = defaults.object(forKey: "userData") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(UserModel.self, from: savedPerson) {
                print(loadedPerson)
                if loadedPerson.username != username{
                    // To store in UserDefaults
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(userSet) {
                        defaults.set(encoded, forKey: "userData")
                    }
                    view?.check(isCreated: true)
                }else{
                    print("User in Database!")
                    view?.check(isCreated: false)
                }
            }
        }
        
    }
    
    required init(view: RegisterVCDelegate?) {
        self.view = view
    }
}
