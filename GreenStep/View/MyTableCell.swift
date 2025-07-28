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
        return imageView
    }()
    
    //MARK: - initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyTableCell {
    func setUp() {
        
    }
    
    func setCellUI() {
        addSubview(postImage)
        postImage.center(inView: self)
    }
}
