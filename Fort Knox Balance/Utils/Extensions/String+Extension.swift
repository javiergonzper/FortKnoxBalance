//
//  String+Extension.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 4/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import Foundation

public extension String {
    
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func localizedYear(year : Int) -> String {
        
        let keywordToChange:String = "$year"
        
        //Replace keywords
        var translated:String = NSLocalizedString(self, comment: "")
        translated = translated.replacingOccurrences(of: keywordToChange, with: String(year), options: .literal, range: nil)
        
        return translated
    }
}
