//  MainViewController.swift
//  AutoLayoutDemo
//
//  Created by Frederick C. Lee on 1/17/15.
//  Copyright (c) 2015 Frederick C. Lee. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import UIKit

class MainViewController: UIViewController {
    
    // Carriage:
    @IBOutlet weak var carriageView: UIView!
    @IBOutlet weak var leftDoor: UIView!
    @IBOutlet weak var rightDoor: UIView!
    
    @IBOutlet weak var carriageBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftDoorWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightDoorWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redView: UIView!
    
    static var staticToggle:Bool = true
    var doorConstraints = [NSLayoutConstraint]()
    
    override func viewDidLayoutSubviews() {
        doorConstraints = [leftDoorWidthConstraint,rightDoorWidthConstraint]
    }
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
    
    func carriageLiftAction() {
        var y:CGFloat = 200.0
        
        if self.carriageView.center.y < 170.0 {
            y = 1.0
        }
        
        UIView.animateWithDuration(0.5) { 
            self.carriageBottomConstraint.constant = y
            self.view.layoutIfNeeded()
        }
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func carriageDoorAction() {
        UIView.animateWithDuration(0.5) {
            NSLayoutConstraint.deactivateConstraints(self.doorConstraints)
            self.view.layoutIfNeeded()
        }
    }
    
    // -----------------------------------------------------------------------------------------------------
    // Mark: - Action methods
    
    
    @IBAction func rotateAction(sender: UIBarButtonItem) {
        startRotation()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func liftAction(sender: UIBarButtonItem) {
        carriageLiftAction()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func doorAction(sender: UIBarButtonItem) {
       carriageDoorAction()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func exitAction(sender: UIBarButtonItem) {
        exit(0)
    }
    
}

