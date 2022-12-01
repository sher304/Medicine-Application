//
//  DoctorCollectionCell.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 29/11/2022.
//

import Foundation
import UIKit
import SnapKit

class DoctorCollectionCell: UICollectionViewCell{
    
    
    static let identifier = "CustomCell"
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Doc Name"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    
    private lazy var specializeLabel: UILabel = {
        let label = UILabel()
        label.text = "Dentist"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    private lazy var makeCallButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Make Call", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(callDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var parentView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    override func layoutSubviews() {
          super.layoutSubviews()
          setConstraints()
      }
    
    
    private func setConstraints(){
        
        contentView.backgroundColor = .red
        
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { make in
            make.trailing.bottom.top.equalToSuperview()
            make.leading.equalTo(10)
        }
        
        parentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(40)
        }
        
        parentView.addSubview(specializeLabel)
        specializeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(nameLabel.snp.leading)
        }
        
        parentView.addSubview(makeCallButton)
        makeCallButton.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.bottom.equalTo(-25)
            make.height.equalTo(30)
        }
    }
    
    @objc func callDidTapped(){
        print("Call Tapped")
    }
}
