//
//  PostEntity.swift
//  GreenStep
//
//  Created by JIN on 7/29/25.
//

import RealmSwift
import UIKit
import Foundation


class PostEntity: Object {
    
    // MARK: - Stored properties
    
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String = ""
    @Persisted var createdAt: Date

    
    // MARK: - Initializer
    
    convenience init(id: String, title: String, createdAt: Date) {
        self.init()
        self.id = id
        self.title = title
        self.createdAt = createdAt
    }
    
}

//MARK: - Model Maping

extension PostEntity {
    func toModelWithoutImage() -> Post {
        Post(id: UUID(uuidString: id) ?? UUID(), title: title, image: nil)
    }
}
