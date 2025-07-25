//
//  UIButton.swift
//  GreenStep
//
//  Created by JIN on 7/25/25.
//

import Foundation
import UIKit

extension UILabel {
    func attributedText(firstPart: String, secondPart: String) {
        let atts: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 72, weight: .bold),
            .foregroundColor: UIColor(#colorLiteral(red: 0, green: 0.4124811292, blue: 0, alpha: 1))
        ]
        let attributedText = NSMutableAttributedString(string: firstPart, attributes: atts)
        
        let unitAtts: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 36, weight: .bold),
            .foregroundColor: UIColor(#colorLiteral(red: 0, green: 0.4124811292, blue: 0, alpha: 1))
        ]
        
        attributedText.append(NSAttributedString(string: secondPart, attributes: unitAtts))
        self.attributedText = attributedText
    }
    
    func attributedCO2SavedText(firstPart: String, secondPart: String) {
        let atts: [NSAttributedString.Key: Any] = [
            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .semibold),
            .foregroundColor: UIColor(#colorLiteral(red: 0, green: 0.4124811292, blue: 0, alpha: 1))
        ]
        let attributedText = NSMutableAttributedString(string: firstPart, attributes: atts)
        
        let unitAtts: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 36, weight: .semibold),
            .foregroundColor: UIColor(#colorLiteral(red: 0, green: 0.4124811292, blue: 0, alpha: 1))
        ]
        
        attributedText.append(NSAttributedString(string: secondPart, attributes: unitAtts))
        self.attributedText = attributedText
    }
}
