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
    
    //MARK: - initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
