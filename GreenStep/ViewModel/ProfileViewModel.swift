//
//  ProfileViewModel.swift
//  GreenStep
//
//  Created by JIN on 7/31/25.
//

import Foundation


class ProfileViewModel {
    
    var user: User?
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        let userData = UserDefaultsStorage.shared
        self.user = userData.get(User.self, forKey: userData.userDefaultsKey)
    }
}
