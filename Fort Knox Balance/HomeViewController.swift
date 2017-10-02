//
//  ViewController.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

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
        
        self.startAnimating()
        
        
        
        /*let delay = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.stopAnimating()
        }*/
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 59
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellsIds.yearUiTableViewCell, for: indexPath) as! YearUiTableViewCell
        cell.title.text = "2017"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func didTapNavigationBarTitleButton() {
        
        var yPositionYearTableView:CGFloat = -112.0
        
        if self.yearTableView.frame.origin.y != 64.0 {
            yPositionYearTableView = 64.0
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
}
