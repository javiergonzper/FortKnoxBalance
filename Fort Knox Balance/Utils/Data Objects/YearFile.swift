//
//  YearFile.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import Foundation

class YearFile: NSObject {
    
    var year: Int?
    var fileName: String?
    var fileType: String?
    
    init(year: Int, fileName: String, fileType: String) {
        self.year = year
        self.fileName = fileName
        self.fileType = fileType
    }
}
