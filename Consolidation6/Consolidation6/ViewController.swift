//
//  ViewController.swift
//  Consolidation6
//
//  Created by Roberto Gutiérrez on 22/03/20.
//  Copyright © 2020 Roberto Gutiérrez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var notes = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Compose", style: .plain, target: self, action: #selector(createNote))
        
        let defaults = UserDefaults.standard
        
        let savedNotes = defaults.object(forKey: "SavedNotes") as? [Note] ?? [Note]()
    }
    
    @objc func createNote() {
        let ac = UIAlertController(title: "New note", message: "Write your note", preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Finish", style: .default)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        //cell.detailTextLabel?.text = notes[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = notes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

