//
//  RegisterViewController.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit

protocol RegisterVCDelegate: AnyObject {
    
    func check(isCreated: Bool)
    
}

class RegisterViewController: UIViewController {
    
    var presenter: RegisterPresenterDelegate?
    
    private lazy var greetingText: UILabel = {
        let label = UILabel()
        label.text = "Hello,"
        label.textColor = Color.customGreen
        label.font =  .systemFont(ofSize: 42, weight: .bold)
        return label
    }()
    
    private lazy var loginText: UILabel = {
        let label = UILabel()
        label.text = "Register now."
        label.textColor = .white
        label.font =  .systemFont(ofSize: 42, weight: .bold)
        return label
    }()
    
    private lazy var loginField: UITextField = {
        let textF = TextField()
        textF.placeholder = "username"
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
    
    private lazy var nameField: UITextField = {
        let textF = TextField()
        textF.placeholder = "name"
        textF.layer.borderWidth = 1
        textF.layer.cornerRadius = 14
        textF.layer.masksToBounds = true
        textF.layer.borderColor = UIColor.black.cgColor
        textF.backgroundColor = .white
        textF.autocorrectionType = .no
        textF.autocapitalizationType = .none
        return textF
    }()
    
    private lazy var surnameField: UITextField = {
        let textF = TextField()
        textF.placeholder = "surname"
        textF.layer.borderWidth = 1
        textF.layer.cornerRadius = 14
        textF.layer.masksToBounds = true
        textF.layer.borderColor = UIColor.black.cgColor
        textF.backgroundColor = .white
        textF.autocorrectionType = .no
        textF.autocapitalizationType = .none
        return textF
    }()
    
    
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = Color.customGreen
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(enterButtonTarget), for: .touchUpInside)
        return button
    }()
    
    
    private func setupConstraints(){
        view.backgroundColor = Color.customDarkBlue
        
        view.addSubview(greetingText)
        greetingText.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(190)
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
        
        
        view.addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(passwordField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        
        view.addSubview(surnameField)
        surnameField.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(nameField.snp.bottom).offset(20)
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }
    
    @objc func enterButtonTarget(){
        presenter?.getData(userModel: UserModel(username: loginField.text, password: passwordField.text, PESEL: Int.random(in: 1000...1600).description, name: nameField.text, surname: surnameField.text, isNurse: false, isDoc: false))
    }
}


extension RegisterViewController: RegisterVCDelegate{

    func check(isCreated: Bool){
        if isCreated{
            let vc = HomeBuilder.build()
            vc.hero.isEnabled = true
            vc.hero.modalAnimationType = .pageIn(direction: .down)
            self.present(vc, animated: true)
        }else{
            greetingText.text = "Username is busy"
        }
    }
    
}
