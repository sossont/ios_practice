//
//  UserInformation.swift
//  SignUpDisplay
//
//  Created by 정환우 on 2021/08/02.
//

import Foundation

class UserInformation {
    static let shared:UserInformation = UserInformation()
    private init(){}
    var name:String?
    var age:String?
    
}
