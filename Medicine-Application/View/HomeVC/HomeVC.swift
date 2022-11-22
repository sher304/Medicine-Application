//
//  HomeVC.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit

protocol HomeVCDelegate: AnyObject{
    
}

class HomeViewController: UIViewController {

    var presenter: HomePresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }

    private func setupConstraints(){
        view.backgroundColor = .green

    }
}


extension HomeViewController: HomeVCDelegate{
    
    
}
