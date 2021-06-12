//
//  UILabelExtension.swift
//  Flash Chat
//
//  Created by Arman Abkar on 6/13/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//

import UIKit

extension UILabel{
    
    func setSubTextColor(pSubString: String, pColor: UIColor, pWeight: UIFont.Weight){
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: self.text!);
        let range = attributedString.mutableString.range(of: pSubString, options:NSString.CompareOptions.caseInsensitive)
        if range.location != NSNotFound {
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: pColor, range: range);
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 17, weight: pWeight), range: range)
        }
        self.attributedText = attributedString
    }
    
}
