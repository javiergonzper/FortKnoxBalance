//
//  ViewController.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var navigationBarTitleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.applyStyles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func applyStyles() {
        
        navigationBarTitleButton.backgroundColor = UIColor.white
        navigationBarTitleButton.layer.cornerRadius = 0
        navigationBarTitleButton.layer.borderWidth = 1
        navigationBarTitleButton.layer.borderColor = UIColor.black.cgColor
        navigationBarTitleButton.setTitle(NSLocalizedString("Home_View_Title_Year", comment: ""), for: UIControlState.normal)
        
    }

}

