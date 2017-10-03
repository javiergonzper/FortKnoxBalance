//
//  Utils.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

final class Utils {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = Utils()

    /*
     * Return "Year XXXX"
     * This method could be modified to support countries that could use a different format like "XXXX Year"
     */
    func getYearString(yearFile:YearFile) -> String {
        return NSLocalizedString("Home_View_Title_Year", comment: "") + " " + String(yearFile.year!)
    }
    
    /*
     * Return "Treasure XXXX"
     * This method could be modified to support countries that could use a different format like "XXXX Treasure"
     */
    func getTreasureString(yearFile:YearFile) -> String {
        return NSLocalizedString("Treasure", comment: "") + " " + String(yearFile.year!)
    }
    
    /*
     * Return $, €... from the Locale
     */
 
    func getLocaleCurrencySymbol () -> String {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        return currencySymbol
    }
    
    /*
     * Calculate the accumulate by year
     */
    func getTotalAccumulateByYear (arrayTreasureGraph:[TreasuryGraph]) -> Float {
        
        var accumulate:Float = 0
        
        for currentTreasureGraph in arrayTreasureGraph {
            accumulate = accumulate + currentTreasureGraph.accumulatedBalance!
        }
        
        return accumulate
    }
}
