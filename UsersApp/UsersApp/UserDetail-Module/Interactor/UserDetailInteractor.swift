//
//  UserDetailInteractor.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class UserDetailInteractor : PresenterToInteractorUserDetailProtocol {
    func userUpdate(user_id: Int, user_name: String, user_phone: String) {
        print("User Update:\(user_id) - \(user_name) - \(user_phone)")
    }
    
    
}
