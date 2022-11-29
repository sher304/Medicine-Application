//
//  MainPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation
import FirebaseAuth

protocol HomePresenterDelegate{
    
    func getUsername(username: String, isNurse: Bool, isDoctor: Bool)
    func viewDidLoad()
    
    init(view: HomeVCDelegate)
}

class HomePresenter: HomePresenterDelegate{
    

    weak var view: HomeVCDelegate?
    
    
    func viewDidLoad(){
        let userEmail : String = (Auth.auth().currentUser?.email)!
        DispatchQueue.main.async {
            self.view?.getUsername(username: userEmail)
        }
    }
    
    func getUsername(username: String, isNurse: Bool, isDoctor: Bool){

    }
    
    
    required init(view: HomeVCDelegate) {
        self.view = view
    }
    
}
