//
//  MainPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation

protocol HomePresenterDelegate{
    
    func getUsername(username: String, isNurse: Bool, isDoctor: Bool)
    func viewDidLoad()
    
    init(view: HomeVCDelegate)
}

class HomePresenter: HomePresenterDelegate{
    

    weak var view: HomeVCDelegate?
    
    
    func viewDidLoad(){
        print("VIEw DID LOAD")
    }
    
    func getUsername(username: String, isNurse: Bool, isDoctor: Bool){
        print("1HOME PRESENTER")
        print(username)
        print(isNurse)
        print(isDoctor)
        print("2HOME PRESENTER")
        view?.getUsername(username: username)
    }
    
    
    required init(view: HomeVCDelegate) {
        self.view = view
    }
    
}
