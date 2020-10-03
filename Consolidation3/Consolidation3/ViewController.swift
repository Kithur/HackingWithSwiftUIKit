//
//  ViewController.swift
//  Consolidation3
//
//  Created by 2020-2 on 16/01/20.
//  Copyright © 2020 Roberto Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var word = ""
    var wordLetters = [String]()
    var usedLetters = [String]()
    var allWords = [String]()
    var propmptWord = ""
    var wrongAsnwers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(loadLevel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        loadLevel()
        
        print(propmptWord)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func loadLevel() {
        usedLetters.removeAll()
        propmptWord = ""
        word = allWords.randomElement()!
        
        for _ in 1...2 {
                   let usedLetter = word.randomElement()
                   let strUsedLetter = String(usedLetter!)
                   usedLetters.append(strUsedLetter)
               }
        
        for letter in word {
            let strLetter = String(letter)
            wordLetters.append(strLetter)
            
            checkLetter(strLetter)
        }
    }
    
    func checkLetter (_ strLetter:  String) {
        if usedLetters.contains(strLetter) {
                       propmptWord += strLetter
                   } else {
                       propmptWord += "?"
                   }
        title = propmptWord
    }
    
    @objc func promptForAnswer() {
           let ac = UIAlertController(title: "Enter a letter",message: nil, preferredStyle: .alert)
           ac.addTextField()
           
           let submitAction = UIAlertAction(title: "Submit", style: .default) {
               [weak self, weak ac] _ in
               guard let answer = ac?.textFields?[0].text else{ return }
               self?.submit(answer.uppercased())
           }
           
           ac.addAction(submitAction)
           present(ac ,animated: true)
       }
    
    func submit(_ answer: String){
        let upperAnswer = answer.uppercased()
        
        if upperAnswer.count > 1 {
            if usedLetters.contains(upperAnswer){
                showErrorMessage(errorTitle: "That letter has already been used", errorMessage: "Try with a different letter")
            }
            showErrorMessage(errorTitle: "That's not a single letter", errorMessage: "Type a single letter")
        } else {
            if wordLetters.contains(upperAnswer) {
                usedLetters.append(upperAnswer)
                checkLetter(upperAnswer)
            } else {
                showErrorMessage(errorTitle: "That letter is not in the word", errorMessage: "Try with another letter")
                wrongAsnwers += 1
                print(wrongAsnwers)
            }
        }
        return
    }
    
    func showErrorMessage (errorTitle title: String, errorMessage message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

