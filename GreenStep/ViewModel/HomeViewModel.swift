//
//  HomeViewModel.swift
//  GreenStep
//
//  Created by JIN on 7/31/25.
//

import Foundation

class HomeViewModel {
    
    var user: User?
    let userStorage = UserDefaultsStorage()
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        self.user = userStorage.get(User.self, forKey: userStorage.userDefaultsKey)
    }
    
    func resetUserData() {
        userStorage.removeValue(forKey: userStorage.userDefaultsKey)
        NotificationCenter.default.post(name: .resetUserData, object: nil)
    }

}
