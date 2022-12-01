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
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var doctorsCollectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionV = UICollectionView(frame: .null, collectionViewLayout: layout)
        collectionV.register(DoctorCollectionCell.self, forCellWithReuseIdentifier: DoctorCollectionCell.identifier)
        collectionV.backgroundColor = Color.customDarkBlue
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.showsHorizontalScrollIndicator = false
        return collectionV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupConstraints()
    }

    private func setupConstraints(){
        view.backgroundColor = Color.customDarkBlue
        
        view.addSubview(usernameTitle)
        usernameTitle.snp.makeConstraints { make in
            make.trailing.equalTo(-30)
            make.top.equalTo(100)
        }
        
        view.addSubview(doctorsCollectionV)
        doctorsCollectionV.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(15)
            make.top.equalTo(usernameTitle.snp.bottom).offset(90)
            make.height.equalTo(260)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorCollectionCell.identifier, for: indexPath) as? DoctorCollectionCell else { return DoctorCollectionCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.doctorsCollectionV.frame.width / 2, height: self.doctorsCollectionV.frame.height / 1.5)
    }
}


extension HomeViewController: HomeVCDelegate{
    func getUsername(username: String){
        DispatchQueue.main.async {
            self.usernameTitle.text = username
        }
    }
}

