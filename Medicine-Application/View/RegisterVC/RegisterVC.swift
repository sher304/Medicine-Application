//
//  RegisterViewController.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit
import SnapKit

protocol RegisterVCDelegate: AnyObject {
    
    func check(isCreated: Bool, message: String?)
    
}

class RegisterViewController: UIViewController {
    
    var presenter: RegisterPresenterDelegate?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        button.tintColor = .white
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
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
        textF.placeholder = "Email"
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
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.top.equalTo(70)
            make.height.width.equalTo(30)
        }
        
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
            make.bottom.equalTo(-120)
            make.height.equalTo(50)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }
    
    @objc func enterButtonTarget(){
        guard let email = loginField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let name = nameField.text, !name.isEmpty,
              let surname = surnameField.text, !surname.isEmpty else {
                  print("Missing Required Data!")
                  return
              }
        presenter?.getData(userModel: UserModel(username: email, password: password, PESEL: Int.random(in: 100000...999999).description, name: name, surname: surname, isNurse: false, isDoc: false))
    }
    
    @objc func backButtonTapped(){
        self.dismiss(animated: true)
    }
}


extension RegisterViewController: RegisterVCDelegate{

    func check(isCreated: Bool, message: String?){
        if isCreated{
            let vc = HomeBuilder.build()
            vc.hero.isEnabled = true
            vc.hero.modalAnimationType = .pageIn(direction: .down)
            self.present(vc, animated: true)
        }else{
            greetingText.text = message
        }
    }
    
}
