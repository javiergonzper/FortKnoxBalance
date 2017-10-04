//
//  ParentViewController.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 2/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ParentViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet var navigationBarView:UIView!
    
    var activityIndicatorView:NVActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.applyStylesForNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applyStylesForNavigationBar() {
        self.navigationBarView.backgroundColor = Colors.navigationBarBackgroundColor
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func startParentAnimating(view: UIView) {
        
        let animationSize:CGFloat = 80.0
        
        let frameSize: CGPoint = CGPoint(x: view.bounds.size.width*0.5,y: view.bounds.size.height*0.5)
        let frameLoading = CGRect(x: frameSize.x-(animationSize/2), y: frameSize.y-(animationSize/2), width: animationSize, height: animationSize)
        
        activityIndicatorView = NVActivityIndicatorView(frame: frameLoading, type: NVActivityIndicatorType(rawValue: NVActivityIndicatorType.orbit.rawValue)!)
        activityIndicatorView?.color = Colors.loadingAnimationColor
        
        view.addSubview(activityIndicatorView!)
        activityIndicatorView?.startAnimating()
        
    }
    
    func stopParentAnimating() {
        activityIndicatorView?.stopAnimating()
    }

}
