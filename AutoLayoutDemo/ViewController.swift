//  MainViewController.swift
//  AutoLayoutDemo
//
//  Created by Frederick C. Lee on 1/17/15.
//  Copyright (c) 2015 Frederick C. Lee. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redView: UIView!
    
    static var staticToggle:Bool = true
    
    // -----------------------------------------------------------------------------------------------------
    
    func animateControls() {
        self.view.layoutIfNeeded()
        
        UIView.animateWithDuration(0.5,
                                   animations: {
                                    self.verticalConstraint.constant = 360.0
                                    self.view.layoutIfNeeded()
        })
    }
    
    
    // -----------------------------------------------------------------------------------------------------
    
    var step:CGFloat = 1.0 as CGFloat
    
    func startRotation() {
        self.view.layoutIfNeeded()
        
        UIView.animateWithDuration(0.5, delay:0.0,
               options:.CurveLinear,
               animations: {
                if MainViewController.staticToggle {
                    self.redView.transform = CGAffineTransformMakeRotation(36);
                } else {
                    self.redView.transform = CGAffineTransformMakeRotation(-36);
                }
                self.view.layoutIfNeeded()
            },
           completion: {(finished:Bool) in
            if finished {
                MainViewController.staticToggle = !MainViewController.staticToggle
            }
        })
        
    }
    
    
    // -----------------------------------------------------------------------------------------------------
    // Mark: - Action methods
    
    
    @IBAction func rotateAction(sender: UIBarButtonItem) {
        startRotation()
    }
    @IBAction func doorAction(sender: UIBarButtonItem) {
        print("Door Action.")
    }
    
    @IBAction func exitAction(sender: UIBarButtonItem) {
        exit(0)
    }
    
}

