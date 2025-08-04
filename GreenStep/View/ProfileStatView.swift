//
//  ProfileStatView.swift
//  GreenStep
//
//  Created by JIN on 7/28/25.
//

import UIKit

class ProfileStatView: UIView {

    //MARK: - Properties
    
    private var treeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tree")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.boldSystemFont(ofSize: 17)
           label.textColor = .gray
           return label
       }()
       
       private let iconImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.tintColor = .gray
           imageView.contentMode = .scaleAspectFit
           return imageView
       }()
       
       private let amountLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
           label.textColor = .systemGreen
           return label
       }()
       
       private let unitLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
           label.textColor = .systemGreen
           return label
       }()
    
    private let stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .leading
            stack.spacing = 28
            return stack
        }()
        
        private let bottomStackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .lastBaseline
            stack.spacing = 0
            return stack
        }()
    
    //MARK: - initialize
    
    init(frame: CGRect, title: String = "", imageName: String = "", amountOfCo2e: Double = 0, unit: String = "") {
        super.init(frame: frame)
        setUp()
        self.configure(title: title, imageName: imageName, amountOfCo2e: amountOfCo2e, unit: unit)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure Method
    
    func configure(title: String, imageName: String, amountOfCo2e: Double, unit: String) {
         titleLabel.text = title
         iconImageView.image = UIImage(systemName: imageName)
         amountLabel.text = amountOfCo2e.asNumberString()
         unitLabel.text = unit
     }
    
}

extension ProfileStatView {
    func setUp() {
        setStackView()
    }
    
    
    func setStackView() {
        addSubview(stackView)
        stackView.center(inView: self)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(amountLabel)
        bottomStackView.addArrangedSubview(unitLabel)
    }
}
    
