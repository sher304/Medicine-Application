//
//  RegisterPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol RegisterPresenterDelegate {
    
    init(view: RegisterVCDelegate?)
    
    func viewDidLoad()
    
    func getData(userModel: UserModel?)
    
    func registerUser(userModel: UserModel?)
}

class RegisterPresenter: RegisterPresenterDelegate{
    
    weak var view: RegisterVCDelegate?
    
    let defaults = UserDefaults.standard
    
    func viewDidLoad(){
        
    }
    
    func getData(userModel: UserModel?){
        registerUser(userModel: userModel)
    }
    
    func registerUser(userModel: UserModel?) {
        let db = Firestore.firestore()
        
        guard let email = userModel?.username, !email.isEmpty,
              let password = userModel?.password, !password.isEmpty,
              let name = userModel?.name, !name.isEmpty,
              let surname = userModel?.surname, !surname.isEmpty,
              let PESEL = userModel?.PESEL, !PESEL.isEmpty,
              let isNurse = userModel?.isNurse, !isNurse,
              let isDoc = userModel?.isDoc, !isDoc else {
            print("Missing Required Data!")
            return
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Failed while Creating Account.")
                print(error?.localizedDescription)
                self.view?.check(isCreated: false)
                return
            }
            
            var ref: DocumentReference? = nil
            
            ref = db.collection("users").addDocument(data: ["name" : name,
                                                            "surname": surname,
                                                            "PESEL": PESEL,
                                                            "isNurse": isNurse,
                                                            "isDoc": isDoc,
                                                            "uid": result!.user.uid]) { (error) in
                if error != nil{
                    print(error?.localizedDescription)
                    self.view?.check(isCreated: false)
                }else{
                    self.view?.check(isCreated: true)
                }
            }
        }
    }
    
    required init(view: RegisterVCDelegate?) {
        self.view = view
    }
}
