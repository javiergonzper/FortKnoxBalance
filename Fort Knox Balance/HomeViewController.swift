//
//  ViewController.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit
import Charts

class HomeViewController: ParentViewController, UITableViewDataSource, UITableViewDelegate, ChartViewDelegate {

    //Navigation bar
    @IBOutlet var navigationBarTitleButton: UIButton!
    @IBOutlet var yearTableView: UITableView!
    
    //Chart
    @IBOutlet var moneyValueLabel: UILabel!
    @IBOutlet var treasureYearLabel: UILabel!
    @IBOutlet var chartView: LineChartView!
    
    //Globar vars
    var selectedYearFile:YearFile?
    var arrayTreasureGraphToShow:[TreasuryGraph] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.applyStyles()
        self.refreshInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func applyStyles() {
        
        //Title/Button of the Navigation bar
        navigationBarTitleButton.backgroundColor = UIColor.white
        navigationBarTitleButton.layer.cornerRadius = 0
        navigationBarTitleButton.layer.borderWidth = 1
        navigationBarTitleButton.layer.borderColor = UIColor.black.cgColor
    }
    
    //Bottom buttons
    @IBAction func infoButtonTapped () {
        
    }
    
    @IBAction func nextButtonTapped () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardIds.detailViewController)
        
        present(controller, animated: true, completion: nil)
    }
    
    func refreshInterface() {
    
        arrayTreasureGraphToShow.removeAll()
        arrayTreasureGraphToShow = UtilsJSON.shared.loadInormationByYearFile(yearFile: selectedYearFile!)
        self.initilizeChartView()
        
        navigationBarTitleButton.setTitle(Utils.shared.getYearString(yearFile: selectedYearFile!), for: UIControlState.normal)
        
        yearTableView.backgroundColor = Colors.navigationBarBackgroundColor
        
        moneyValueLabel.text = String(Utils.shared.getTotalAccumulateByYear(arrayTreasureGraph: arrayTreasureGraphToShow)) + Utils.shared.getLocaleCurrencySymbol()
        treasureYearLabel.text = Utils.shared.getTreasureString(yearFile: selectedYearFile!)
    }
    
    func loadData() {
        
        /*let delay = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: delay) {
            seFlf.stopAnimating()
        }*/
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JSONDataInfo.allYearsAndFilesAvailable.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIds.yearUiTableViewCell, for: indexPath) as! YearUiTableViewCell
        cell.title.text = Utils.shared.getYearString(yearFile: JSONDataInfo.allYearsAndFilesAvailable[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.selectedYearFile = JSONDataInfo.allYearsAndFilesAvailable[indexPath.row]
        self.refreshInterface()
    }
    
    //MARK: - NavigationBar
    @IBAction func didTapNavigationBarTitleButton() {
        
        let maxNumberRowsVisible:CGFloat = 4.0
        var yPositionYearTableView:CGFloat!
        let heightStatusBar = UIApplication.shared.statusBarFrame.size.height
        
        if self.yearTableView.frame.origin.y < 0 {
            //To be visisble
            
            yPositionYearTableView = heightStatusBar + FramesSizes.YearUITableViewCell
            
            //Size of the yearTableView in function of the number of the years
            if CGFloat(JSONDataInfo.allYearsAndFilesAvailable.count) <= maxNumberRowsVisible {
                
                yearTableView.frame = CGRect(x:yearTableView.frame.origin.x , y:-(FramesSizes.YearUITableViewCell*CGFloat(JSONDataInfo.allYearsAndFilesAvailable.count)) , width: yearTableView.frame.width, height: FramesSizes.YearUITableViewCell*CGFloat(JSONDataInfo.allYearsAndFilesAvailable.count))
                yearTableView.isScrollEnabled = false
                
            } else {
                
                yearTableView.isScrollEnabled = true
                
            }
        } else {
            //To be hidden
            yPositionYearTableView = -(UIApplication.shared.statusBarFrame.size.height + FramesSizes.YearUITableViewCell * maxNumberRowsVisible)
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.yearTableView.frame.origin.y = yPositionYearTableView
        }, completion: { (finished) -> Void in
            // ....
        })
    }
    
    //MARK: - Charts
    
    func initilizeChartView() {
        
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.chartDescription?.text = ""
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<arrayTreasureGraphToShow.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(arrayTreasureGraphToShow[i].accumulatedBalance!), data: "Pepe" as AnyObject)
                dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = LineChartData(dataSet: chartDataSet)
        chartView.data = chartData
        
    }
}
