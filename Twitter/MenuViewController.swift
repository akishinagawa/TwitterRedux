//
//  MenuViewController.swift
//  Twitter
//
//  Created by Akifumi Shinagawa on 11/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuTableView: UITableView!
    
    private var tweetsNavigationController:UIViewController!
    private var profileNavigationController:UIViewController!
    private var mentionsNavigationController:UIViewController!
    
    var viewControllers:[UIViewController] = []
    var hamburgerViewController: HamburgerViewController!
    var titles = ["Home Timeline", "Profile", "Mentions"]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        tweetsNavigationController = storyBoard.instantiateViewController(withIdentifier: "TweetsNavigationController")
        profileNavigationController = storyBoard.instantiateViewController(withIdentifier: "ProfileNavigationController")
        mentionsNavigationController = storyBoard.instantiateViewController(withIdentifier: "MentionsNavigationController")
        
        viewControllers.append(tweetsNavigationController)
        viewControllers.append(profileNavigationController)
        viewControllers.append(mentionsNavigationController)
        
        hamburgerViewController.contentViewController = tweetsNavigationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.menuTitleLabel.text = titles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        menuTableView.deselectRow(at: indexPath, animated: true)
        
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
        
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
