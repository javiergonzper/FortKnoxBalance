//
//  YearFile.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import Foundation

class YearFile: NSObject {
    
    var year: NSNumber?
    var fileName: String?
    
    init(year: NSNumber, fileName: String) {
        self.year = year
        self.fileName = fileName
    }
}
