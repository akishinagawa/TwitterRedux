//
//  ProfileTableViewObject.swift
//  Twitter
//
//  Created by Akifumi Shinagawa on 11/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ProfileTableViewObject: NSObject, UITableViewDataSource, UITableViewDelegate {

    var targetUserInfo: TargetUserInfo!
    var tweets: [Tweet]?
    var tableView:UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell!
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            (cell as! ProfileTableViewCell).targetUserInfo = targetUserInfo
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "TweetsTableViewCell", for: indexPath) as! TweetsTableViewCell
            (cell as! TweetsTableViewCell).tweet = tweets?[indexPath.row - 1]
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return ((tweets?.count)! + 1)
        }
        else {
            return 0
        }
    } 
}
