//
//  LoginViewController.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit

protocol LoginVCDelegate: AnyObject{
    
    func check(message: String?)
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        view.backgroundColor = .orange
    }
    
}

extension LoginViewController: LoginVCDelegate{
    
    func check(message: String?){
        print(message!)
    }
}
