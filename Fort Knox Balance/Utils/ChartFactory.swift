//
//  ChartFactory.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 5/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit
import Charts

final class ChartFactory {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = ChartFactory()
    
    func getHomeChart(chartView:LineChartView, arrayTreasureGraphToShow:[TreasuryGraph]) -> LineChartView {
        
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.chartDescription?.text = ""
        chartView.legend.enabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        
        chartView.noDataText = "No_data_available".localized()
        
        if arrayTreasureGraphToShow.count > 0 {
            
            var valueColors = [UIColor]()
            var dataEntries: [ChartDataEntry] = []
            
            for i in 0..<arrayTreasureGraphToShow.count {
                let dataEntry = ChartDataEntry(x: Double(i), y: Double(arrayTreasureGraphToShow[i].accumulatedBalance!))
                dataEntries.append(dataEntry)
                valueColors.append(colorPicker(value: arrayTreasureGraphToShow[i].accumulatedBalance!))
            }
            
            let chartDataSet = LineChartDataSet(values: dataEntries, label: "")
            chartDataSet.colors = valueColors
            chartDataSet.drawCirclesEnabled = false
            chartDataSet.drawValuesEnabled = false
            chartDataSet.mode = .cubicBezier
            
            let chartData = LineChartData(dataSet: chartDataSet)
            chartView.data = chartData
        } else {
            chartView.clear()
        }
        
        return chartView
    }
    
    
    func colorPicker(value : Float) -> UIColor {
        
        //input your own logic for how you actually want to color the x axis
        if value <= -0.0 {
            return UIColor.red
        } else {
            return UIColor.green
        }
    }
}
