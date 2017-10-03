//
//  UtilsJSON.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 3/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit
import SwiftyJSON

final class UtilsJSON {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = UtilsJSON()
    
    func loadInormationByYearFile(yearFile:YearFile) -> [TreasuryGraph] {
        
        var arrayTreasureGraphByYear:[TreasuryGraph] = []
        
        if let file = Bundle.main.path(forResource: yearFile.fileName, ofType: yearFile.fileType) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                let json = JSON(data: data)
                
                let outputData = json.dictionary!["outputData"]
                let treasuryDataGraph = outputData!.dictionary!["TreasuryDataGraph"]
                let treasuryDataGraphRepeated = treasuryDataGraph!.dictionary!["TreasuryGraphData"]
                let treasuryGraph = treasuryDataGraphRepeated!.dictionary!["TreasuryGraph"]
                
                for current in treasuryGraph! {
                    
                    let year:Int = Int((current.1.dictionary!["Year"]?.description)!)!
                    
                    //Clean the JSON
                    if year == yearFile.year {
                        
                        let month:Int = Int((current.1.dictionary!["Month"]?.description)!)!
                        let accumulatedBalance:Float = Float((current.1.dictionary!["AccumulatedBalance"]?.description)!)!
                        
                        arrayTreasureGraphByYear.append(TreasuryGraph(year: year, month: month, accumulatedBalance: accumulatedBalance))
                    }
                    
                }
                
            } catch {
                print("Error getting JSON")
            }
        } else {
            print("File does not exist: " + yearFile.fileName! + yearFile.fileType!)
        }
        
        return arrayTreasureGraphByYear
    }
}
