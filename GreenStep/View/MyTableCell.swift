//
//  TableViewCell.swift
//  GreenStep
//
//  Created by JIN on 7/27/25.
//

import UIKit

//MARK: - Protocol

protocol Cellidentity {
    static var identifier: String { get }
}

extension Cellidentity {
    static var identifier: String {
        return String(describing: self)
    }
}

class MyTableCell: UICollectionViewCell, Cellidentity {
    
    //MARK: - Properties
    
    
    
    private var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    //MARK: - initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyTableCell {
    func setUp() {
        setCellUI()
        backgroundColor = .systemBackground
    }
    
    func setCellUI() {
        addSubview(postImage)
        postImage.fillSuperview()
    }
    
    func configureWithData(with post : Post) {
        postImage.image = post.image
    }
}
