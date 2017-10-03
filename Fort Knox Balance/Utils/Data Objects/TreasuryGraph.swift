//
//  TreasuryGraph.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

class TreasuryGraph: NSObject {

    var year: Int?
    var month: Int?
    var accumulatedBalance: Float?
    
    init(year: Int, month: Int, accumulatedBalance: Float) {
        self.year = year
        self.month = month
        self.accumulatedBalance = accumulatedBalance
    }
    
}
