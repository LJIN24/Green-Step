//
//  ImageStorage.swift
//  GreenStep
//
//  Created by JIN on 7/30/25.
//

import UIKit

protocol ImageStorageProtocol {
  func save(image: UIImage, filename: String) throws
  func load(filename: String) -> UIImage?
  func delete(filename: String) throws
}


enum FileManagerError: Error {
  case invalidFilePath
  case invalidData
  case failToWrite(error: Error)
}

final class ImageStorage: ImageStorageProtocol {
    
  let baseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
  func save(image: UIImage, filename: String) throws {
      
    let url = baseURL.appendingPathComponent(filename)
      guard let data = image.pngData() else { throw FileManagerError.invalidData }
    try data.write(to: url)
  }
    
  func load(filename: String) -> UIImage? {
    let url = baseURL.appendingPathComponent(filename)
    return UIImage(contentsOfFile: url.path)
  }
    
    
  func delete(filename: String) throws {
    let url = baseURL.appendingPathComponent(filename)
    try FileManager.default.removeItem(at: url)
  }
}
