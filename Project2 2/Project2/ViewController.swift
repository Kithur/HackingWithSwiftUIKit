//
//  ViewController.swift
//  Project2
//
//  Created by Roberto Gutiérrez on 09/11/19.
//  Copyright © 2019 Roberto Gutiérrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    struct Me: Codable {
        let highScore: Int
    }
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestions = 0
    var highScore: Codable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        let defaults = UserDefaults.standard
        
        if let savedScore = defaults.object(forKey: "highScore") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                highScore = try jsonDecoder.decode(highScore.self, from: savedScore)
                //   highScore = try jsonDecoder.decode(highScore, from: savedScore)
            } catch {
                print("failed to load people")
            }
        }
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Guess the " + countries[correctAnswer].uppercased() + " flag, your score is:\(score)"
        
        totalQuestions += 1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if totalQuestions < 10{
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else{
            title = "Wrong, that's the flag of " + countries[sender.tag].uppercased()
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
        present(ac, animated: true)
        } else{
            if sender.tag == correctAnswer {
               title = "Correct"
                score += 1
            } else{
                title = "Wrong"
                score -= 1
            }
            if  highScore >= score {
            let ac = UIAlertController(title: title, message: "Your final score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
                present(ac, animated: true)
                totalQuestions = 0
                score = 0
            } else if highScore < score {
                let ac = UIAlertController(title: title, message: "New Highscore: \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
                present(ac, animated: true)
                totalQuestions = 0
                highScore = score
                save()
                score = 0
            }
        }
    }
    
    @objc func shareTapped(){
    let vc = UIActivityViewController(activityItems: ["Your score is \(score)"], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(highScore) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey:  "highScore")
        } else {
            print("failed to save highScore.")
        }
    }
}

