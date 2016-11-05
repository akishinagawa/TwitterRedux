//
//  LoginViewController.swift
//  Twitter
//
//  Created by Akifumi Shinagawa on 10/29/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: AnyObject) {
        TwitterClient.sharedInstance?.login(success: {() -> ()  in
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }, failure: {(error: Error) -> () in
            print("Login Error: \(error.localizedDescription)")
        })
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
