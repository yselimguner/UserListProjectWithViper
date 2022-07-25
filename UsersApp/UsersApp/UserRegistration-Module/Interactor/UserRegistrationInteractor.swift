//
//  UserRegistrationInteractor.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class UserRegistrationInteractor:PresenterToInteractorUserRegistrationProtocol {
    func userAdd(user_name: String, user_phone: String) {
        print("User Registration: \(user_name) - \(user_phone)")
    }
}
