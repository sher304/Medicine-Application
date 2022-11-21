//
//  RegisterViewController.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit

protocol RegisterVCDelegate: AnyObject {
    
}

class RegisterViewController: UIViewController {
    
    var presenter: RegisterPresenterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        view.backgroundColor = .blue
    }
}


extension RegisterViewController: RegisterVCDelegate{
    
    
}
