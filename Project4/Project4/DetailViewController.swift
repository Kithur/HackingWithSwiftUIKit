//
//  DetailViewController.swift
//  Project4
//
//  Created by Roberto Gutiérrez on 16/11/19.
//  Copyright © 2019 Roberto Gutiérrez. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    var websites = ["apple.com", "hackingwithswift.com"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Web Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
        

    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Site", for:indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Site") as? ViewController {
            vc.selectedSite = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
