//
//  MentionsTableViewObject.swift
//  Twitter
//
//  Created by Akifumi Shinagawa on 11/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class MentionsTableViewObject: NSObject, UITableViewDataSource, UITableViewDelegate {

    
    var tweets: [Tweet]?
    var tableView:UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetsTableViewCell", for: indexPath) as! TweetsTableViewCell
        cell.tweet = tweets?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return (tweets?.count)!
        }
        else {
            return 0
        }
    }
    
    
    
}
