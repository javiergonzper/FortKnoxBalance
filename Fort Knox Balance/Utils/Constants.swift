//
//  Constants.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

struct FramesSizes {
    static let YearUITableViewCell:CGFloat = 44.0
    static let NavigationBarView:CGFloat = 44.0
}

struct StoryboardIds {
    
    //Cells
    static let yearUiTableViewCell = "YearUiTableViewCell"
    static let monthBalanceTableViewCell = "MonthBalanceTableViewCell"
    
    //ViewControllers
    static let detailViewController = "detailViewController"
    
}

struct Colors {
    static let navigationBarBackgroundColor = UIColor.groupTableViewBackground
    static let loadingAnimationColor = UIColor.lightGray
    static let monthDateViewColor = UIColor.init ( red: 228.0/255.0, green: 46.0/255.0, blue: 46.0/255.0, alpha: 1.0 )
    
}

struct JSONDataInfo {
    static let allYearsAndFilesAvailable:Array = [YearFile(year: 2017, fileName: "2017-treasury", fileType: "json"),
                                                  YearFile(year: 2016, fileName: "2016-treasury_1", fileType: "json")
                                                  ]
}
