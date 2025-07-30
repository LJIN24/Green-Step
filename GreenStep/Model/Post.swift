//
//  Post.swift
//  GreenStep
//
//  Created by JIN on 7/28/25.
//

import UIKit
import RealmSwift



func newSizeImageWidthDownloadedResource(image: UIImage) -> UIImage {
    let targetWidth = (UIScreen.main.bounds.width - 56) / 2
    let newSizeImage = image.resize(newWidth: targetWidth)
    return newSizeImage
}

struct Post {
    let id: UUID
    let title: String
    let createdAt = Date()
    var image: UIImage?
    
    init(id: UUID = UUID(), title: String, image: UIImage?) {
        self.id = id
        self.title = title
        self.image = image
    }
    
    var resizeImage: UIImage? {
        guard let image = image else { return nil }
        return newSizeImageWidthDownloadedResource(image: image)
    }
    
}

extension Post {
    func toEntity() -> PostEntity {
        PostEntity(id: id.uuidString, title: title, createdAt: createdAt)
    }
    
    
}

