//
//  MyTableViewModel.swift
//  GreenStep
//
//  Created by JIN on 7/29/25.
//

import Foundation

class MyTableViewModel {
    
    var posts: [Post] = []
    
    
    private let respository: PostRepositoryProtocol
    
    init(postRepository: PostRepositoryProtocol) {
        self.respository = postRepository
    }
    
    func fetchPosts() {
        self.posts = respository.fetchAll()
    }
    
}
