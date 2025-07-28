//
//  Post.swift
//  GreenStep
//
//  Created by JIN on 7/28/25.
//

import Foundation
import UIKit


func newSizeImageWidthDownloadedResource(image: UIImage) -> UIImage {
    let targetWidth = (UIScreen.main.bounds.width - 56) / 2
    let newSizeImage = image.resize(newWidth: targetWidth)
    return newSizeImage
}

struct Post {
    let originalImage: UIImage
    let resizedImage: UIImage
    let title: String?
    
    init(originalImage: UIImage, title: String? = nil) {
        self.originalImage = originalImage
        self.resizedImage = newSizeImageWidthDownloadedResource(image: originalImage)
        self.title = title
    }
}
