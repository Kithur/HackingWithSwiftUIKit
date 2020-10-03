//
//  ViewController.swift
//  Consolidation2
//
//  Created by Roberto Gutiérrez on 22/11/19.
//  Copyright © 2019 Roberto Gutiérrez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(refresh))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        refresh()
    }

    @objc func refresh() {
        title = "Shopping List"
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

    @objc func addItem() {
    let ac = UIAlertController(title: "Enter item name",message: nil, preferredStyle: .alert)
    ac.addTextField()
    
    let submitItem = UIAlertAction(title: "Sumit", style: .default) {
        [weak self, weak ac] _ in
        guard let answer = ac?.textFields?[0].text else{ return }
        self?.shoppingList.insert(answer, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        self?.tableView.insertRows(at: [indexPath], with: .automatic)
        
        return
    }
    
    ac.addAction(submitItem)
    present(ac ,animated: true)
    }

}
