//
//  Utils.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

class Utils: NSObject {

    func getYearString(yearFile:YearFile) -> String {
        return NSLocalizedString("Home_View_Title_Year", comment: "") + " " + String(yearFile.year!)
    }
}