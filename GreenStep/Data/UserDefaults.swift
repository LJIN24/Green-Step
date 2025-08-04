//
//  UserDefaults.swift
//  GreenStep
//
//  Created by JIN on 7/31/25.
//

import Foundation

protocol userDefaultsProtocol {
  func set<T: Codable>(_ value: T, forKey key: String)
  func get<T: Codable>(_ type: T.Type, forKey key: String) -> T?
  func removeValue(forKey key: String)
}


final class UserDefaultsStorage: userDefaultsProtocol {
    
  static let shared = UserDefaultsStorage()
    
  private let defaults: UserDefaults
    
  let userDefaultsKey = "user"
    
  init(defaults: UserDefaults = .standard) {
    self.defaults = defaults
  }

  func set<T: Codable>(_ value: T, forKey key: String) {
    if let data = try? JSONEncoder().encode(value) {
      defaults.set(data, forKey: key)
    }
  }

  func get<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
    guard let data = defaults.data(forKey: key),
          let object = try? JSONDecoder().decode(type, from: data) else {
      return nil
    }
    return object
  }

  func removeValue(forKey key: String) {
    defaults.removeObject(forKey: key)
  }
}

