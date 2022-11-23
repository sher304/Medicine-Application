//
//  OnBoardVC.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 23/11/2022.
//

import UIKit

protocol OnBoardVCDelegate: AnyObject{
    
}

class OnBoardVC: UIViewController {
    
    var presenter: OnBoardPresenterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .brown
    }
}


extension OnBoardVC: OnBoardVCDelegate{
    
}
