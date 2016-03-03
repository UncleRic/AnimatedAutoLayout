//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by Frederick C. Lee on 1/17/15.
//  Copyright (c) 2015 Frederick C. Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redView: UIView!
    
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
    
    func startAnimation() {
        self.view.layoutIfNeeded()
        var shit:Bool = true
        UIView.animateWithDuration(0.5, delay:0.0,
                                   options:.CurveLinear,
                                   animations: {
                                    if shit {
                                        self.redView.transform = CGAffineTransformMakeRotation(36);
                                    } else {
                                        self.redView.transform = CGAffineTransformMakeRotation(72);
                                    }
                                    self.view.layoutIfNeeded()
            },
                                   completion: {(finished:Bool) in
                                    if finished {
                                        if shit {
                                            self.startAnimation()
                                            shit = false
                                        }
                                    }
        })
        
    }
    
    
    
    // -----------------------------------------------------------------------------------------------------
    // Mark: - Action methods
    
    @IBAction func doSomethingAction(sender: UIButton) {
        startAnimation()
    }
    
    @IBAction func exitAction(sender: UIButton) {
        exit(0)
    }
    
}

