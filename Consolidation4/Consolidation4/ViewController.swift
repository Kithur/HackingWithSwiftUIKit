//
//  ViewController.swift
//  Consolidation4
//
//  Created by 2020-2 on 28/01/20.
//  Copyright © 2020 Roberto Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
    }

    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
            picker.sourceType = .camera
            picker.allowsEditing = true
            present(picker, animated: true)
        } else {
            let ac = UIAlertController(title: "Error", message: "Camera not found", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(ac, animated: true)
        }
    }

}

