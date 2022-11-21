//
//  LoginViewController.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit
import SnapKit

protocol LoginVCDelegate: AnyObject{
    
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterDelegate?
    
    private lazy var greetingText: UILabel = {
        let label = UILabel()
        label.text = "Hello,"
        label.textColor = Color.customGreen
        label.font =  .systemFont(ofSize: 42, weight: .bold)
        return label
    }()
    
    private lazy var loginText: UILabel = {
        let label = UILabel()
        label.text = "Login now."
        label.textColor = .white
        label.font =  .systemFont(ofSize: 42, weight: .bold)
        return label
    }()
    
    private lazy var loginField: UITextField = {
        let textF = TextField()
        textF.placeholder = "email"
        textF.layer.borderWidth = 1
        textF.layer.cornerRadius = 14
        textF.layer.masksToBounds = true
        textF.layer.borderColor = UIColor.black.cgColor
        textF.backgroundColor = .white
        textF.autocorrectionType = .no
        textF.autocapitalizationType = .none
        return textF
    }()
    
    private lazy var passwordField: UITextField = {
        let textF = TextField()
        textF.placeholder = "password"
        textF.layer.borderWidth = 1
        textF.layer.cornerRadius = 14
        textF.layer.masksToBounds = true
        textF.layer.borderColor = UIColor.black.cgColor
        textF.backgroundColor = .white
        textF.autocorrectionType = .no
        textF.autocapitalizationType = .none
        textF.isSecureTextEntry = true
        return textF
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = Color.customGreen
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = Color.customDarkBlue
        
        view.addSubview(greetingText)
        greetingText.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.centerY.equalToSuperview().offset(-90)
        }
        
        view.addSubview(loginText)
        loginText.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(greetingText.snp.bottom).offset(5)
        }
        
        
        view.addSubview(loginField)
        loginField.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(loginText.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(loginField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(enterButton)
        enterButton.snp.makeConstraints { make in
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
            make.bottom.equalTo(-170)
            make.height.equalTo(50)
        }
    }
    
}

extension LoginViewController: LoginVCDelegate{
    
}
