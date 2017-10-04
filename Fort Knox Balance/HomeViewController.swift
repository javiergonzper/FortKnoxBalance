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
    @IBOutlet var disableView:UIView!
    
    //Chart
    @IBOutlet var moneyValueLabel: UILabel!
    @IBOutlet var treasureYearLabel: UILabel!
    @IBOutlet var chartView: LineChartView!
    
    //Globar vars
    var selectedYearFile:YearFile?
    var arrayTreasureGraphToShow:[TreasuryGraph] = []
    let animationShowHiddeYearTableViewDuration = 0.5
    
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
        
        disableView.isHidden = true
    }
    
    //Bottom buttons
    @IBAction func infoButtonTapped () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardIds.creditViewController)
        
        present(controller, animated: true, completion: nil)
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
        
        navigationBarTitleButton.setTitle("Home_View_Title_Year".localizedYear(year: (selectedYearFile?.year)!), for: UIControlState.normal)
        
        yearTableView.backgroundColor = Colors.navigationBarBackgroundColor
        
        moneyValueLabel.text = String(Utils.shared.getTotalAccumulateByYear(arrayTreasureGraph: arrayTreasureGraphToShow)) + Utils.shared.getLocaleCurrencySymbol()
        moneyValueLabel.changeSizeDollarEuroCharacter(size: 12.0)
        treasureYearLabel.text = "Treasure".localizedYear(year: selectedYearFile!.year!)
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
        cell.title.text = "Home_View_Title_Year".localizedYear(year: JSONDataInfo.allYearsAndFilesAvailable[indexPath.row].year!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.selectedYearFile = JSONDataInfo.allYearsAndFilesAvailable[indexPath.row]
        self.didTapNavigationBarTitleButton()
        
        //Animation
        self.startParentAnimating(view: self.chartView)
        let when = DispatchTime.now() + animationShowHiddeYearTableViewDuration
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.refreshInterface()
            self.stopParentAnimating()
        }
    }
    
    //MARK: - NavigationBar
    @IBAction func didTapNavigationBarTitleButton() {
        
        let maxNumberRowsVisible:CGFloat = 4.0
        var yPositionYearTableView:CGFloat!
        let heightStatusBar = UIApplication.shared.statusBarFrame.size.height
        
        var isYearTableViewVisible:Bool!
        
        if self.yearTableView.frame.origin.y < 0 {
            //To be visisble
            isYearTableViewVisible = true
            
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
            isYearTableViewVisible = false
        }
        
        //Animation
        self.animationToShowOrHiddeYearTableView(isYearTableViewVisible: isYearTableViewVisible, yPositionYearTableView: yPositionYearTableView)
    }
    
    func animationToShowOrHiddeYearTableView(isYearTableViewVisible: Bool, yPositionYearTableView: CGFloat) {
        UIView.animate(withDuration: animationShowHiddeYearTableViewDuration,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.yearTableView.frame.origin.y = yPositionYearTableView
        }, completion: { (finished) -> Void in
            if isYearTableViewVisible {
                self.disableView.isHidden = false
                self.disableView.alpha = 0.0
                UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                    self.disableView.alpha = 0.7
                }, completion: { _ in
                    
                })
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                    self.disableView.alpha = 0.0
                }, completion: { _ in
                    self.disableView.isHidden = true
                })
            }
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
