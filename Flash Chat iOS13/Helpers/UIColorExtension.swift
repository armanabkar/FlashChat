//
//  UIColorExtension.swift
//  Flash Chat
//
//  Created by Arman Abkar on 6/13/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
