//
//  LoginViewController.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit
import Hero
import SnapKit

protocol LoginVCDelegate: AnyObject{
    func openHomeVC(validated: Bool?)
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterDelegate?
    
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
        label.text = "Login now."
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
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Email", for: .normal)
        button.backgroundColor = Color.customGreen
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(enterButtonTarget), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
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
    
    @objc func enterButtonTarget(){
        presenter?.getUserData(email: loginField.text, password: passwordField.text)
    }
    
    @objc func backButtonTapped(){
        self.dismiss(animated: true)
    }
    
}

extension LoginViewController: LoginVCDelegate{
    
    func openHomeVC(validated: Bool?){
        if validated == true{
            let vc = HomeBuilder.build()
            vc.hero.isEnabled = true
            vc.hero.modalAnimationType = .cover(direction: .down)
            self.present(vc, animated: true)
        }else{
            greetingText.text = "Incorrect Data!"
        }
    }
}
