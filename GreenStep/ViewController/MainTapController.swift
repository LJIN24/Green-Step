//
//  MainTapViewController.swift
//  GreenStep
//
//  Created by JIN on 7/24/25.
//

import UIKit

class MainTapController: UITabBarController {

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
}

   // MARK: - UI & Layout

extension MainTapController {
    
    private func setUp() {
        setUpTabBar()
        configureViewControllers()
    }
    
    func setUpTabBar() {
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .systemGreen
    }
    
    func configureViewControllers() {
        
        let home = navigationControllerWrapper(tabBarImage: UIImage(systemName: "house.fill")!, rootViewController: HomeController())
        
        let table = navigationControllerWrapper(tabBarImage: UIImage(systemName: "fork.knife.circle.fill")!, rootViewController: TableController())
        
        let profile = navigationControllerWrapper(tabBarImage: UIImage(systemName: "person.crop.circle.fill")!, rootViewController: ProfileController())
        
        viewControllers = [
            home,
            table,
            profile
        ]
    }

    func navigationControllerWrapper(tabBarImage: UIImage, rootViewController: UIViewController) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = tabBarImage
        navigationController.tabBarItem.selectedImage = tabBarImage
        navigationController.navigationBar.tintColor = .systemGreen
        return navigationController
    }
}

#Preview {
    MainTapController()
}
