//
//  Users.swift
//  UsersApp
//
//  Created by Yavuz Güner on 24.07.2022.
//

import Foundation

class Users {
    var user_id:Int?
    var user_name:String?
    var user_phone:String?
    
    init() {
        
    }
    
    init(user_id:Int,user_name:String,user_phone:String) {
        self.user_id = user_id
        self.user_name = user_name
        self.user_phone = user_phone
    }
}
