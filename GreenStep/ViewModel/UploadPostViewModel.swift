//
//  UploadPostViewModel.swift
//  GreenStep
//
//  Created by JIN on 7/29/25.
//


import UIKit

class UploadPostViewModel {
    
    
    var postImage: UIImage? {
        didSet {
            didChangeImageValue?(true)
        }
    }
    
    var didChangeImageValue: ((Bool) -> Void)?
    
    
    let postRepository: PostRepositoryProtocol
    
    init (postRepository: PostRepositoryProtocol) {
        self.postRepository = postRepository
    }
    
    
    let userStorage = UserDefaultsStorage()
    
    
    
    func uploadPost(title: String, image: UIImage?) {
        let post = Post(title: title, image: image)
        postRepository.save(post)
        updateUserInfo()
        setNotification()
        
    }
    
    func updateUserInfo() {
        let user = userStorage.get(User.self, forKey: userStorage.userDefaultsKey) ?? User(today: 0, total: 0)
        let updatedUser = User(today: user.today + 3.25, total: user.total + 3.25)
        userStorage.set(updatedUser, forKey: userStorage.userDefaultsKey)
        print("함수 정상적으로 호출\(updatedUser)")
    }
    
    func setNotification() {
        
        NotificationCenter.default.post(name: .didUploadPost, object: nil)
    }
   
    
}
