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
    
    var listYearsAvailable:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.applyStyles()
        self.loadData()
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
        navigationBarTitleButton.setTitle(NSLocalizedString("Home_View_Title_Year", comment: ""), for: UIControlState.normal)
        
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
        cell.title.text = JSONDataInfo.allYearsAndFilesAvailable[indexPath.row].year?.stringValue
        
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
                let json = try JSON(data: data)
            } catch {
                print("Error getting JSON")
            }
        } else {
            
        }
    }
}
