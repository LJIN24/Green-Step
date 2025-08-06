//
//  DetailViewController.swift
//  GreenStep
//
//  Created by JIN on 7/30/25.
//

import UIKit

class DetailViewController: UIViewController {

  //MARK: - Properties
    
    let post: Post
    
    let viewModel: DetailViewModel
    
    private var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var caption: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.systemGreen.cgColor
        label.layer.cornerRadius = 5
        label.textAlignment = .center
        return label
    }()
    
    private var date: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.backgroundColor = UIColor.systemGreen
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.addTarget(self, action: #selector(handleDeleteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Initializer
    
    init(viewModel: DetailViewModel, post: Post) {
          self.post = post
          self.viewModel = viewModel
          super.init(nibName: nil, bundle: nil)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "My Food Diary"
        configure()
        setup()
    }
    
    //MARK: - Private Method
    
   @objc private func handleDeleteButtonTapped() {
            let alert = UIAlertController(
                title: "정말 삭제하시겠습니까?",
                message: "이 작업은 되돌릴 수 없습니다.",
                preferredStyle: .alert
            )
           
           alert.view.tintColor = .systemGreen

            let cancel = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(cancel)

            let delete = UIAlertAction(title: "삭제", style: .destructive) { [weak self] _ in
                guard let self = self else { return }
                viewModel.delete(post: post)
                navigationController?.popViewController(animated: true)
            }
            alert.addAction(delete)

            present(alert, animated: true)
        }

    
    private func configure() {
        postImage.image = post.image
        caption.text = post.title.isEmpty == false ? post.title : "GreenStep🌳"
        date.text = post.createdAt.asShortDateString()
    }

}

//MARK: - UI & Layout

extension DetailViewController {
    
    func setup() {
        setImage()
        setLabel()
        setDeleteButton()
    }
    
    func setImage() {
        view.addSubview(postImage)
        postImage.setDimensions(height: 340, width: view.frame.width)
        postImage.anchor(top: view.topAnchor, paddingTop: 150)
    }
    
    func setLabel() {
        view.addSubview(caption)
        view.addSubview(date)
        caption.setDimensions(height: 36, width: 360)
        caption.anchor(top: postImage.bottomAnchor, paddingTop: 20)
        caption.centerX(inView: view)
        date.setDimensions(height: 36, width: 360)
        date.anchor(top: caption.bottomAnchor, paddingTop: 12)
        date.centerX(inView: view)
    }
    
    func setDeleteButton() {
        view.addSubview(deleteButton)
        deleteButton.setDimensions(height: 50, width: 50)
        deleteButton.anchor(right: view.rightAnchor, paddingRight: 5)
        deleteButton.anchor(bottom: postImage.topAnchor, paddingBottom: 5)
    }
}
