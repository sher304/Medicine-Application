//
//  OnBoardVC.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 23/11/2022.
//

import UIKit
import Hero
import SnapKit

protocol OnBoardVCDelegate: AnyObject{
    
}

class OnBoardVC: UIViewController {
    
    var presenter: OnBoardPresenterDelegate?
    
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = Color.customGreen
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var greetingText: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Medicine Application!"
        label.font = .systemFont(ofSize: 42, weight: .heavy)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = Color.customDarkBlue
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
            make.bottom.equalTo(-170)
            make.height.equalTo(50)
        }
        
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
            make.height.equalTo(50)
            make.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        view.addSubview(greetingText)
        greetingText.snp.makeConstraints { make in
            make.leading.equalTo(70)
            make.trailing.equalTo(-70)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func buttonDidTapped(btn: UIButton){
        if btn == registerButton{
            let vc = RegisterBuilder.build()
            vc.hero.isEnabled = true
            vc.hero.modalAnimationType = .fade
            self.present(vc, animated: true)
        }else{
            let vc = LoginBuilder.build()
            vc.hero.isEnabled = true
            vc.hero.modalAnimationType = .fade
            self.present(vc, animated: true)
        }
    }
}

extension OnBoardVC: OnBoardVCDelegate{
    
}
