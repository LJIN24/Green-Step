//
//  MyTableViewModel.swift
//  GreenStep
//
//  Created by JIN on 7/29/25.
//

import Foundation

class MyTableViewModel {
    
    @Published var posts: [Post] = []
    
    
    let postRepository = PostRepository()
    
    func fetchPosts() {
        self.posts = postRepository.fetchAll()
        print(self.posts)
    }
    
}
