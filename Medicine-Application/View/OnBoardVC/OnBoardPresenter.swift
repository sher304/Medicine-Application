//
//  OnBoardPresenter.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 23/11/2022.
//

import Foundation

protocol OnBoardPresenterDelegate {
    
    init(view: OnBoardVCDelegate)
    
}

class OnBoardPresenter: OnBoardPresenterDelegate{
    weak var view: OnBoardVCDelegate?
    
    required init(view: OnBoardVCDelegate) {
        self.view = view
    }
}
