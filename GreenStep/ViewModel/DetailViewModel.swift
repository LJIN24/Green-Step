//
//  DetailViewModel.swift
//  GreenStep
//
//  Created by JIN on 7/30/25.
//

import Foundation

class DetailViewModel {
    
    let repository = PostRepository()
   
    func delete(post: Post) {
        repository.delete(post)
        NotificationCenter.default.post(name: .didDeleteCell, object: nil)
    }
}
