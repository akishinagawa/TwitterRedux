//
//  HamburgerViewController.swift
//  Twitter
//
//  Created by Akifumi Shinagawa on 11/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewLeftMarginConstraint: NSLayoutConstraint!
    
    var originalContentViewLeftMarginConstraint:CGFloat!
    
    var menuViewController: UIViewController!
//        {
//        didSet {
//            view.layoutIfNeeded()
//            
//            menuView.addSubview(menuViewController.view)
//        }
//    }
//    
    
    var contentViewController: UIViewController! {
        didSet(oldContentViewController) {
            view.layoutIfNeeded()
            
            if oldContentViewController != nil {
                oldContentViewController.willMove(toParentViewController: nil)
                oldContentViewController.view.removeFromSuperview()
                oldContentViewController.didMove(toParentViewController: nil)
            }
            
            contentViewController.willMove(toParentViewController: self)
            contentView.addSubview(contentViewController.view)
            contentViewController.didMove(toParentViewController: self)
            
            UIView.animate(withDuration: 0.3, animations: {
                self.contentViewLeftMarginConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        menuViewController.hamburgerViewController = self
        
        self.menuViewController = menuViewController
        
        menuView.addSubview(menuViewController.view)
       
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)

        if sender.state == UIGestureRecognizerState.began {
            originalContentViewLeftMarginConstraint = contentViewLeftMarginConstraint.constant
        }
        else if sender.state == UIGestureRecognizerState.changed {
            if originalContentViewLeftMarginConstraint + translation.x > 0 {
                contentViewLeftMarginConstraint.constant = originalContentViewLeftMarginConstraint + translation.x
            }
        }
        else if sender.state == UIGestureRecognizerState.ended {
            UIView.animate(withDuration: 0.3, animations: {
                if velocity.x > 0 {
                    self.contentViewLeftMarginConstraint.constant = self.view.frame.size.width - 50
                }
                else {
                    self.contentViewLeftMarginConstraint.constant = 0
                }
                self.view.layoutIfNeeded()
            })
        }
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