//
//  ViewController.swift
//  GuessMyFactors
//
//  Created by Sreya Guha on 9/20/17.
//  Copyright © 2017 Sreya Guha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = GTFGame()

    override func viewDidLoad() {
        super.viewDidLoad()
        firstFactor.delegate = self
        secondFactor.delegate = self
        var result = game.playTheGame()
        welcome.text = "The sum is  \(String(result.0)) and the product is  \(String(result.1))! Guess the factors!"
        
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }

   // let firstNumber = Int(arc4random_uniform(5) + 7)
    
  //  let secondNumber = Int(arc4random_uniform(5) + 7)
    @IBOutlet weak var welcome: UILabel!

    @IBOutlet weak var firstFactor: UITextField!
    @IBOutlet weak var secondFactor: UITextField!
    
    @IBAction func playAgain(_ sender: UIButton) {
        var result = game.playTheGame()
        welcome.text = "The sum is \(String(result.0)) \n and the product is \(String(result.1))! Guess the factors!"
        firstFactor.text = ""
        secondFactor.text = ""
    }
    

        // Do any additional setup after loading the view, typically from a nib.
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guessButton(_ sender: UIButton) {
        
        if let textEntry = firstFactor.text {
            if let guess1 = Int(textEntry) {
                if let textsecond = secondFactor.text {
                    if let guess2 = Int(textsecond) {
                        welcome.text = game.checkGuess(guessOne: guess1, guessTwo: guess2)
        }
    }
        }
        }
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstFactor: secondFactor.becomeFirstResponder()
        case secondFactor: secondFactor.resignFirstResponder()
        default:
            secondFactor.resignFirstResponder()
        }
        return true
    }
    
}






