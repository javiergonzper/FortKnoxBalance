//
//  ViewController.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: ParentViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var navigationBarTitleButton: UIButton!
    @IBOutlet var yearTableView: UITableView!
    
    var selectedYearFile:YearFile?
    var arrayTreasureGraphToShow:[TreasuryGraph] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.applyStyles()
        self.loadInormationByYearFile(yearFile: selectedYearFile!)
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
        navigationBarTitleButton.setTitle(Utils().getYearString(yearFile: selectedYearFile!), for: UIControlState.normal)
        
        yearTableView.backgroundColor = Colors.navigationBarBackgroundColor
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
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellsIds.yearUiTableViewCell, for: indexPath) as! YearUiTableViewCell
        cell.title.text = Utils().getYearString(yearFile: JSONDataInfo.allYearsAndFilesAvailable[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
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
    
    //MARK: - JSON Information
    func loadInormationByYearFile(yearFile:YearFile) {
        
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
                    if year == selectedYearFile?.year {
                        
                        let month:Int = Int((current.1.dictionary!["Month"]?.description)!)!
                        let accumulatedBalance:Float = Float((current.1.dictionary!["AccumulatedBalance"]?.description)!)!
                        
                        arrayTreasureGraphToShow.append(TreasuryGraph(year: year, month: month, accumulatedBalance: accumulatedBalance))
                    }
                    
                }
                
            } catch {
                print("Error getting JSON")
            }
        } else {
            print("File does not exist: " + yearFile.fileName! + yearFile.fileType!)
        }
    }
    
}
