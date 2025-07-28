//
//  ProfileController.swift
//  GreenStep
//
//  Created by JIN on 7/24/25.
//

import UIKit

class ProfileController: UIViewController {
    
    //MARK: -Properties
    
    private var treeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tree")
        return imageView
    }()
    
    private var popupInfo: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
        let image  = UIImage(systemName: "questionmark.circle.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .systemGreen
        button.layer.cornerRadius = 12.5
        return button
    }()
    
 
    private var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.7)
        return view
    }()

    let stat1 = ProfileStatView(frame: .zero, title: "지금까지 내가 심은 나무", imageName: "tree.fill", amountOfCo2e: 0, unit: "그루")
    
    let stat2 = ProfileStatView(frame: .zero, title: "지금까지 내가 걸은 그린스텝", imageName: "figure.walk", amountOfCo2e: 0, unit: "Km")
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setTitle()
        view.backgroundColor = .systemBackground
    }
    
    //MARK: Private Method
    private func setTitle() {
        navigationItem.title = "Profile"
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
        treeImage.anchor(top: view.topAnchor, paddingTop: 100)
    }
    
    func setDivierUI() {
        view.addSubview(divider)
        divider.setDimensions(height: 1, width: view.frame.width)
        divider.anchor(left: view.leftAnchor, paddingLeft: 20)
        divider.anchor(right: view.rightAnchor, paddingRight: 20)
        divider.anchor(top: stat1.bottomAnchor, paddingTop: 0)
    }
    
    func setStatViewUI() {
    
        view.addSubview(stat1)
        stat1.setDimensions(height: 250, width: 360)
        stat1.anchor(top: treeImage.bottomAnchor, paddingTop: 36)
        stat1.anchor(left: view.leftAnchor, paddingLeft: -70)
        
        view.addSubview(stat2)
        stat2.setDimensions(height: 250, width: 360)
        stat2.anchor(top: stat1.bottomAnchor, paddingTop: 0)
        stat2.anchor(left: view.leftAnchor, paddingLeft: -60)
    }
    
    func setPopUpButtonUI() {
        view.addSubview(popupInfo)
        popupInfo.setDimensions(height: 25, width: 25)
        popupInfo.anchor(right: view.rightAnchor, paddingRight: 25)
        popupInfo.anchor(top: view.topAnchor, paddingTop: 50)
    }

}

#Preview {
    ProfileController()
}
