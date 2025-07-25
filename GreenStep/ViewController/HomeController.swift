//
//  HomeController.swift
//  GreenStep
//
//  Created by JIN on 7/24/25.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private var footPrintImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "footprint")
        return imageView
    }()
    
    private var todayTotalCo2Label: UILabel = {
        let label = UILabel()
        label.attributedText(firstPart: "34.56", secondPart: "kg")
        return label
    }()
    
    private var Co2SavedLabel: UILabel = {
        let label = UILabel()
        label.attributedCO2SavedText(firstPart: "CO₂e", secondPart: "Saved")
        return label
    }()
    
    private lazy var addGreenStepButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Green Step", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(handleAddGreenStep), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Action
    
    @objc func handleAddGreenStep() {
        let controller = SelectImageController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

}

// MARK: - UI & Layout

extension HomeController {
    
    func configureUI() {
        navigationItem.title = "GreenStep"
        setImageUI()
        setLabelUI()
        setButtonUI()
    }
    
    func setImageUI() {
        view.addSubview(footPrintImage)
        footPrintImage.setDimensions(height: 350, width: 350)
        footPrintImage.centerX(inView: view)
        footPrintImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
    }
    
    func setLabelUI() {
        footPrintImage.addSubview(todayTotalCo2Label)
        todayTotalCo2Label.centerX(inView: view)
        todayTotalCo2Label.anchor(top: footPrintImage.bottomAnchor, paddingTop: 20)
        todayTotalCo2Label.addSubview(Co2SavedLabel)
        Co2SavedLabel.centerX(inView: view)
        Co2SavedLabel.anchor(bottom: todayTotalCo2Label.bottomAnchor, paddingBottom: -40)
    }
    
    func setButtonUI() {
        view.addSubview(addGreenStepButton)
        addGreenStepButton.setDimensions(height: 45, width: 320)
        addGreenStepButton.centerX(inView: view)
        addGreenStepButton.anchor(bottom: view.bottomAnchor, paddingBottom: 100)
    }
}
#Preview {
    HomeController()
}
