//
//  MainPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation

protocol HomePresenterDelegate{
    
    init(view: HomeVCDelegate)
}

class HomePresenter: HomePresenterDelegate{
    

    weak var view: HomeVCDelegate?
    
    
    required init(view: HomeVCDelegate) {
        self.view = view
    }
    
}
