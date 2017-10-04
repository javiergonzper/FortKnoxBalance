//
//  UILabel+Extension.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 4/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func changeSizeDollarEuroCharacter(size: Float){
        
        let nsRange:NSRange = (text! as NSString).range(of: Utils.shared.getLocaleCurrencySymbol())
        
        let amountText = NSMutableAttributedString.init(string: text!)
        
        // set the custom font and color for the 0,1 range in string
        amountText.setAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(size))],
                                 range: nsRange)
        // if you want, you can add more attributes for different ranges calling .setAttributes many times
        
        // set the attributed string to the UILabel object
        attributedText = amountText
    }
}
