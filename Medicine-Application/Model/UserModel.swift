//
//  User.swift
//  Medicine-Application
//
//  Created by Шермат Эшеров on 21/11/2022.
//

import Foundation

struct UserModel: Codable{
    
    let username: String?
    let password: String?
    let PESEL: String?
    let name: String?
    let surname: String?
    let isNurse: Bool?
    let isDoc: Bool?
    
    static let userData: [UserModel] = [UserModel(username: "shifuSher", password: "password", PESEL: "3004", name: "shifu", surname: "po", isNurse: false, isDoc: false)]
    
}



