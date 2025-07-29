//
//  PopupViewController.swift
//  GreenStep
//
//  Created by JIN on 7/29/25.
//

import UIKit

final class CustomPopupViewController: DimmedViewController {

    //MARK: -Properties
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap))

    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.cornerRadius = 8
        return view
    }()

    private let titleLabel: UILabel = {
          let lb = UILabel()
          lb.text = "1Kg CO₂e 란?"
          lb.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
          lb.textColor = .systemGreen
          return lb
      }()
    
    private lazy var confirmButton: UIButton = {
         let btn = UIButton(type: .system)
         btn.setTitle("확인했어요", for: .normal)
         btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
         btn.setTitleColor(.white, for: .normal)
         btn.backgroundColor = .systemGreen
         btn.layer.cornerRadius = 6
         btn.addTarget(self, action: #selector(close), for: .touchUpInside)
        return btn
     }()
    
          
      private lazy var firstRow = makeRow(
          iconName: "tree.fill",
          text: "나무 한 그루가 약 2주동안 흡수하는 양"
      )
      
      private lazy var secondRow = makeRow(
          iconName: "car.side.fill",
          text: "자동차 약 6km 주행 시 배출되는 양"
      )
    
    //MARK: - Private Method
    
    @objc private func handleBackgroundTap() {
        dismiss(animated: true)
    }
    
    private func makeRow(iconName: String, text: String) -> UIStackView {
        let iv = UIImageView(image: UIImage(systemName: iconName))
        iv.tintColor = .systemGreen
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setContentHuggingPriority(.required, for: .horizontal)
        
        let lbl = UILabel()
        lbl.text = text
        lbl.font = UIFont.preferredFont(forTextStyle: .headline)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        let h = UIStackView(arrangedSubviews: [iv, lbl])
        h.axis = .horizontal
        h.alignment = .center
        h.spacing = 8
        h.translatesAutoresizingMaskIntoConstraints = false
        
        return h
    }

      
     @objc private func close() {
        dismiss(animated: true)
    }
    
    //MARK: - initialize
    
    override init() {
        super.init()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}

//MARK: -UI & Layout

extension CustomPopupViewController {
    
    func setUp() {
        setContainer()
        setTitleLabel()
        setRow()
        setButton()
        setBackgroundGesture()
        
    }
    
    func setBackgroundGesture() {
        view.addGestureRecognizer(tapGesture)
    }
    
    func setContainer() {
        view.addSubview(containerView)
        containerView.center(inView: view)
        containerView.setDimensions(height: 280, width: 340)
        containerView.addSubview(titleLabel)
        containerView.addSubview(firstRow)
        containerView.addSubview(secondRow)
        containerView.addSubview(confirmButton)
    }
    
    func setTitleLabel() {
        titleLabel.centerX(inView: containerView)
        titleLabel.anchor(top: containerView.topAnchor, paddingTop: 40)
    }
    
    func setRow() {
        firstRow.anchor(top: titleLabel.bottomAnchor, paddingTop: 35)
        secondRow.anchor(top: firstRow.bottomAnchor, paddingTop: 20)
        firstRow.centerX(inView: containerView)
        secondRow.centerX(inView: containerView)
    }
    
    func setButton() {
       
        confirmButton.setDimensions(height: 40, width: 250)
        confirmButton.centerX(inView: containerView)
        confirmButton.anchor(bottom: containerView.bottomAnchor, paddingBottom: 50)
        
    }
}


#Preview {
    CustomPopupViewController()
}
