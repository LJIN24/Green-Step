//
//  PostRepository.swift
//  GreenStep
//
//  Created by JIN on 7/29/25.
//

import RealmSwift
import UIKit


protocol PostRepositoryProtocol {
    func save(_ post: Post)
    func fetchAll() -> [Post]
    func delete(_ post: Post)
}

final class PostRepository: PostRepositoryProtocol {
    // MARK: - Dependencies
    private let realmStorage: RealmStorageProtocol
    private let imageStorage: ImageStorageProtocol

    init(
        realmStorage: RealmStorageProtocol,
        imageStorage: ImageStorageProtocol
    ) {
        self.realmStorage = realmStorage
        self.imageStorage = imageStorage
    }

    // MARK: - Save
    func save(_ post: Post) {
        
        let entity = post.toEntity()
        realmStorage.save(item: entity)

        guard let iamge = post.image else { return }
        
        do {
            try imageStorage.save(image: iamge, filename: post.id.uuidString)
        } catch {
            print("[PostRepository] failed to save image: \(error)")
        }
    }

    // MARK: - Fetch
    func fetchAll() -> [Post] {
        let entities = realmStorage.fetch(PostEntity.self)
        return entities.map { entity in
        var post = entity.toModelWithoutImage()
            post.image = imageStorage.load(filename: post.id.uuidString)
            return post
        }
     
    }

    // MARK: - Delete
    
    func delete(_ post: Post) {
    
        let results = realmStorage.fetch(PostEntity.self)
        guard let entity = results.first(where: { $0.id == post.id.uuidString }) else { return }

        realmStorage.delete(item: entity)

        do {
            try imageStorage.delete(filename: post.id.uuidString)
        } catch {
            print("[PostRepository] failed to delete image: \(error)")
        }
    }
}
