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

struct Months {
    static let allMonths:Array = [MonthData(name: "", dateFormatted: "01/00/"), //Dummy month
                                  MonthData(name: "January".localized(), dateFormatted: "01/01/"),
                                  MonthData(name: "February".localized(), dateFormatted: "01/02/"),
                                  MonthData(name: "March".localized(), dateFormatted: "01/03/"),
                                  MonthData(name: "April".localized(), dateFormatted: "01/04/"),
                                  MonthData(name: "May".localized(), dateFormatted: "01/05/"),
                                  MonthData(name: "June".localized(), dateFormatted: "01/06/"),
                                  MonthData(name: "July".localized(), dateFormatted: "01/07/"),
                                  MonthData(name: "August".localized(), dateFormatted: "01/08/"),
                                  MonthData(name: "September".localized(), dateFormatted: "01/09/"),
                                  MonthData(name: "October".localized(), dateFormatted: "01/10/"),
                                  MonthData(name: "November".localized(), dateFormatted: "01/11/"),
                                  MonthData(name: "December".localized(), dateFormatted: "01/12/"),
                                  ]
}

struct JSONDataInfo {
    static let allYearsAndFilesAvailable:Array = [YearFile(year: 2017, fileName: "2017-treasury", fileType: "json"),
                                                  YearFile(year: 2016, fileName: "2016-treasury_1", fileType: "json")
                                                  ]
}
