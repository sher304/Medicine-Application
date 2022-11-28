//
//  HomeVC.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import UIKit
import SnapKit

protocol HomeVCDelegate: AnyObject{
    func getUsername(username: String)
}

class HomeViewController: UIViewController {

    var presenter: HomePresenterDelegate?
    
    private lazy var usernameTitle: UILabel = {
        let label = UILabel()
        label.text = "USERNAME!"
        label.font = .systemFont(ofSize: 24, weight: .regular)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupConstraints()
    }

    private func setupConstraints(){
        view.backgroundColor = .green
        view.addSubview(usernameTitle)
        usernameTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}


extension HomeViewController: HomeVCDelegate{
    func getUsername(username: String){
        print("1USERNAME !")
        print(username)
        print("2USERNAME !")
        self.loadViewIfNeeded()
        self.usernameTitle.text = username
    }
}
