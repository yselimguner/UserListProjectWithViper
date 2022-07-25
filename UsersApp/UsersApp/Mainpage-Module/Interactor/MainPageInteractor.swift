//
//  MainPageInteractor.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class MainPageInteractor:PresenterToInteractorMainPageProtocol{
    var mainPagePresenter: InteractorToPresenterMainPageProtocol?
    
    func takeAllUsers() {
        var userList = [Users]()
        
        let u1 = Users(user_id: 1, user_name: "Yavuz", user_phone: "123123123")
        let u2 = Users(user_id: 2, user_name: "Selin", user_phone: "123423422")
        userList.append(u1)
        userList.append(u2)
        
        mainPagePresenter?.sendDataToPresenter(usersList: userList)
    }
    
    func searchUser(searchWord: String) {
        print("Arama sonucu: \(searchWord)")
    }
    
    func deleteUser(user_id: Int) {
        print("\(user_id) deleted")
    }
    
    
    
    
}
