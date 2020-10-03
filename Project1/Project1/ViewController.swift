//
//  ViewController.swift
//  Project1
//
//  Created by Roberto Gutiérrez on 06/11/19.
//  Copyright © 2019 Roberto Gutiérrez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    //var counters = [Counter]()
    var timesOpened = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        performSelector(inBackground: #selector(loadImages), with: nil)
        print(pictures)
    }
    
    @objc func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl"){
                // this is a picture to load!
                pictures.append(item)
            }
            pictures.sort()
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        //cell.detailTextLabel?.text =
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.current = indexPath.row+1
            vc.total = pictures.count
            timesOpened += 1
            print("\(timesOpened)")
            //vc.timesOpened += 1
            //print("\(vc.timesOpened)")
            navigationController?.pushViewController(vc,animated: true)
        }
    }
    
    @objc func shareTapped(){
    let image = "Try to see the storms"
    
    let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
    }
}

