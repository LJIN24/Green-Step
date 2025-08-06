//
//  DIcontainer.swift
//  GreenStep
//
//  Created by JIN on 8/7/25.
//

//
//  DIContainer.swift
//  EasyCloset
//
//  Created by Mason Kim on 2023/05/27.
//

import Foundation

final class DIContainer {
  
  // MARK: - SingleTon
  
  static let shared = DIContainer()
  private init() {}
  
  // MARK: - Properties
  
  private let realmStorage: RealmStorageProtocol = RealmStorage()
  private let imageStorage: ImageStorageProtocol = ImageStorage()
  
    private lazy var postRepository: PostRepositoryProtocol = PostRepository(
    realmStorage: realmStorage,
    imageStorage: imageStorage)
  
  // MARK: - DI Factory Methods
  
    func makeHomeController() -> HomeController {
        let viewModel = HomeViewModel()
        return HomeController(viewModel: viewModel)
  }
  
    func makeMyTableController() -> MyTableController {
     let viewModel = MyTableViewModel(postRepository: postRepository)
        return MyTableController(viewModel: viewModel, collectionViewLayout: PinterestLayout())
        
    }
    
    func makeProfileController() -> ProfileController {
        let viewModel = ProfileViewModel()
        return ProfileController(viewModel: viewModel)
      }
    
    func makeDetailViewController(post: Post) -> DetailViewController {
        let viewModel = DetailViewModel(repository: postRepository)
        return DetailViewController(viewModel: viewModel, post: post)
    }
    
    func makeUploadImageController() -> UploadImageController {
        let viewModel = UploadPostViewModel(postRepository: postRepository)
        return UploadImageController(viewModel: viewModel)
    }
    
  }
