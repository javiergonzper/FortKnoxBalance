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

struct UITableViewCellsIds {
    
    static let yearUiTableViewCell = "YearUiTableViewCell"
    
}

struct Colors {
    static let navigationBarBackgroundColor = UIColor.groupTableViewBackground
    static let loadingAnimationColor = UIColor.lightGray
}

struct JSONDataInfo {
    static let allYearsAndFilesAvailable:Array = [YearFile(year: 2016, fileName: "2016-treasury_1.json", fileType: "json"),
                                                  YearFile(year: 2017, fileName: "2017-treasury.json", fileType: "json")]
}
