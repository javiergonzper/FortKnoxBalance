//
//  MonthData.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 3/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import Foundation

class MonthData: NSObject {

    var name: String?
    var dateFormatted: String?
    
    init(name: String, dateFormatted: String) {
        self.name = name
        self.dateFormatted = dateFormatted
    }
}
