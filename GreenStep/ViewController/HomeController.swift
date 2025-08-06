//
//  HomeController.swift
//  GreenStep
//
//  Created by JIN on 7/24/25.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModel
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .regular)
        let image  = UIImage(systemName: "arrow.trianglehead.clockwise.rotate.90", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .systemGreen
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleResetButton), for: .touchUpInside)
        return button
    }()
    
    private var footPrintImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "footprint")
        return imageView
    }()
    
    private var todayTotalCo2Label: UILabel = {
        let label = UILabel()
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
    
    // MARK: - Initialization
     
    init(viewModel: HomeViewModel) {
       self.viewModel = viewModel
       super.init(nibName: nil, bundle: nil)
     }
     
     required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
     }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
        addObserver()
    }

    
    // MARK: - Action
    
    @objc func handleAddGreenStep() {
        let controller = DIContainer.shared.makeUploadImageController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleResetButton() {
        let alert = UIAlertController(
            title: "정말 초기화 하시겠습니까?",
            message: "이 작업은 되돌릴 수 없습니다.",
            preferredStyle: .alert
        )
       
       alert.view.tintColor = .systemGreen

        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancel)

        let delete = UIAlertAction(title: "초기화", style: .destructive) { [weak self] _ in
            self?.viewModel.resetUserData()
        }
        alert.addAction(delete)

        present(alert, animated: true)
    
        print("reset")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - UI & Layout

extension HomeController {
    
    private func configureData() {
        todayTotalCo2Label.attributedText(firstPart: "\(viewModel.user?.today ?? 0)", secondPart: "kg")
    }
    
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
        view.addSubview(resetButton)
        resetButton.setDimensions(height: 28, width: 28)
        resetButton.anchor(top: view.topAnchor, paddingTop: 100)
        resetButton.anchor(right: view.rightAnchor, paddingRight: 30)
    }
}

//MARK: - addOberver

extension HomeController {
    
    
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
          self.viewModel.fetchUser()
          self.configureData()
      }
    
}


#Preview {
    HomeController(viewModel: HomeViewModel())
}
