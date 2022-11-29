//
//  DoctorCollectionCell.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 29/11/2022.
//

import Foundation
import UIKit


class DoctorCollectionCell: UICollectionViewCell{
    
    
    static let identifier = "CustomCell"
    
    
    override func layoutSubviews() {
          super.layoutSubviews()
          setConstraints()
      }
    
    
    private func setConstraints(){
        contentView.backgroundColor = .darkGray
    }
}
