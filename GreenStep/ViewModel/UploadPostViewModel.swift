//
//  UploadPostViewModel.swift
//  GreenStep
//
//  Created by JIN on 7/29/25.
//


import UIKit

class UploadPostViewModel {
    
    @Published var posts = [Post]()
    
    let postRepository = PostRepository()

    
    func uploadPost(title: String, image: UIImage?) {
        let post = Post(title: title, image: image)
        postRepository.save(post)
    }
    
}
