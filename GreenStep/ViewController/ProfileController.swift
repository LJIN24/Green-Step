//
//  ProfileController.swift
//  GreenStep
//
//  Created by JIN on 7/24/25.
//

import UIKit

class ProfileController: UIViewController {
    
    //MARK: -Properties
    
    let viewModel = ProfileViewModel()
    
    
    var amountOfCo2 : Double {
        viewModel.user?.total ?? 0
    }
    
    private var treeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tree")
        return imageView
    }()
    
    private lazy var popupInfo: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .regular)
        let image  = UIImage(systemName: "questionmark.circle.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .systemGreen
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
 
    private var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.7)
        return view
    }()

    lazy var stat1 = ProfileStatView(frame: .zero, title: "지금까지 내가 심은 나무", imageName: "tree.fill", amountOfCo2e: amountOfCo2, unit: "그루")
    
    lazy var stat2 = ProfileStatView(frame: .zero, title: "지금까지 내가 걸은 그린스텝", imageName: "figure.walk", amountOfCo2e: amountOfCo2 * 6, unit: "Km")
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setTitle()
        addObserver()
        view.backgroundColor = .systemBackground
    }
    
    //MARK: Private Method
    private func setTitle() {
        navigationItem.title = "Profile"
    }
    
    @objc private func tap() {
         let popupVC = CustomPopupViewController()
         present(popupVC, animated: true)
     }
    
    private func reNewStatView() {
        stat1.configure(title: "지금까지 내가 심은 나무" , imageName: "tree.fill", amountOfCo2e: amountOfCo2, unit: "그루")
        stat2.configure(title: "지금까지 내가 걸은 그린스텝", imageName: "figure.walk", amountOfCo2e: amountOfCo2 * 6, unit: "Km")
    }
    
}

//MARK: - UI & Layout

extension ProfileController {
    func setUp() {
        setImageUI()
        setStatViewUI()
        setDivierUI()
        setPopUpButtonUI()
    }
    
    func setImageUI() {
        view.addSubview(treeImage)
        treeImage.setDimensions(height: 150, width: 150)
        treeImage.centerX(inView: view)
        treeImage.anchor(top: view.topAnchor, paddingTop: 120)
    }
    
    func setDivierUI() {
        view.addSubview(divider)
        divider.setDimensions(height: 1, width: 180)
        divider.centerX(inView: view)
        divider.anchor(top: stat1.bottomAnchor, paddingTop: 0)
    }
    
    func setStatViewUI() {
    
        view.addSubview(stat1)
        stat1.setDimensions(height: 250, width: 360)
        stat1.anchor(top: treeImage.bottomAnchor, paddingTop: 16)
        stat1.centerX(inView: view)
        
        view.addSubview(stat2)
        stat2.setDimensions(height: 250, width: 360)
        stat2.anchor(top: stat1.bottomAnchor, paddingTop: 0)
        stat2.centerX(inView: view)
    }
    
    func setPopUpButtonUI() {
        view.addSubview(popupInfo)
        popupInfo.setDimensions(height: 28, width: 28)
        popupInfo.anchor(top: view.topAnchor, paddingTop: 100)
        popupInfo.anchor(left: view.leftAnchor, paddingLeft: 18)
    }


}



extension ProfileController {
    
    func addObserver () {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reloadData),
            name: .didUploadPost,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reloadData),
            name: .resetUserData,
            object: nil
        )
    }
        
      @objc func reloadData() {
          viewModel.fetchUser()
          reNewStatView()
      }
}

#Preview {
    ProfileController()
}
