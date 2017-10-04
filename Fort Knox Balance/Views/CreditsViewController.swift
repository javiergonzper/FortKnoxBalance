//
//  CreditsViewController.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 4/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {
    
    @IBOutlet var titleNavigationBarLabel:UILabel!
    @IBOutlet var backButton:UIButton!
    @IBOutlet var longTextCreditLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.applyStyles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applyStyles() {
        titleNavigationBarLabel.text = "Credits".localized()
        backButton.setTitle("Back".localized(), for: UIControlState.normal)
        longTextCreditLabel.text = "Credits_long_text".localized()
    }
    
    // MARK: - Buttons
    @IBAction func backButtonTapped () {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
