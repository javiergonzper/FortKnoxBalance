//
//  DetailViewController.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 3/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

class DetailViewController: ParentViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var titleNavigationBarLabel:UILabel!
    @IBOutlet var backButton:UIButton!
    @IBOutlet var allYearsDataTableView:UITableView!
    
    var arrayOfArraysTreasureGraphToShow:[[TreasuryGraph]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.applySyles()
        self.loadAllYears()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applySyles() {
        backButton.setTitle(NSLocalizedString("Back", comment: ""), for: UIControlState.normal)
    }
    
    func loadAllYears() {
        for currentYearFile in JSONDataInfo.allYearsAndFilesAvailable {
            arrayOfArraysTreasureGraphToShow.append(UtilsJSON.shared.loadInormationByYearFile(yearFile: currentYearFile))
        }
    }
    
    @IBAction func backButtonTapped () {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfArraysTreasureGraphToShow.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(JSONDataInfo.allYearsAndFilesAvailable[section].year!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfArraysTreasureGraphToShow[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIds.monthBalanceTableViewCell, for: indexPath) as! MonthBalanceTableViewCell
        
        cell.balanceValueLabel.text = String(arrayOfArraysTreasureGraphToShow[indexPath.section][indexPath.row].accumulatedBalance!)
        cell.monthDateLabel.text = (arrayOfArraysTreasureGraphToShow[indexPath.section][indexPath.row].month?.dateFormatted)! + String(JSONDataInfo.allYearsAndFilesAvailable[indexPath.section].year!)
        cell.monthTextLabel.text = arrayOfArraysTreasureGraphToShow[indexPath.section][indexPath.row].month?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

}