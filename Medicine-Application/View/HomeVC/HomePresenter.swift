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
        let userID : String = (Auth.auth().currentUser?.email)!
        print("Current user ID is" + userID)
        view?.getUsername(username: userID)
    }
    
    func getUsername(username: String, isNurse: Bool, isDoctor: Bool){
        let userID : String = (Auth.auth().currentUser?.email)!
        print("Current user ID is" + userID)
        view?.getUsername(username: userID)
    }
    
    
    required init(view: HomeVCDelegate) {
        self.view = view
    }
    
}
