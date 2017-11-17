//
//  ViewController.swift
//  GuessMyFactors
//
//  Created by Sreya Guha on 9/20/17.
//  Copyright © 2017 Sreya Guha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var game = GTFGame()
  //  var backgroundMusicPlayer: AVAudioPlayer?
    
   // var player:AVAudioPlayer = AVAudioPlayer()
    
   //  @discardableResult func playSound(named soundName: String) -> AVAudioPlayer {
     //   let audioPath = Bundle.main.path(forResource: "correct", ofType: "mp3")
       // do {
         //   try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
    //    } catch {
           // print(error)
    //    }
    //    return player
  //  }
    
    @IBOutlet weak var guessLabel: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
   //     audioPlayer = AVAudioPlayer(contentsOfURL: correctSound, error: nil)
        firstFactor.delegate = self
        secondFactor.delegate = self
        difficultyLevel.setTitle("Easy", forSegmentAt: 0)
        difficultyLevel.setTitle("Hard", forSegmentAt: 1)
        var result = game.playTheGame(difficulty: difficultyLevel.titleForSegment(at: difficultyLevel.selectedSegmentIndex)!)
        welcome.text = "The sum is \(String(result.0)) and the product is \(String(result.1))! Can you guess the factors?"

        
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }

   // let firstNumber = Int(arc4random_uniform(5) + 7)
    
  //  let secondNumber = Int(arc4random_uniform(5) + 7)
    @IBOutlet weak var welcome: UILabel!

    @IBOutlet weak var firstFactor: UITextField!
    @IBOutlet weak var secondFactor: UITextField!
    
    @IBOutlet weak var scoreButton: UILabel!
    
    @IBAction func playAgain(_ sender: UIButton) {
        var result = game.playTheGame(difficulty: difficultyLevel.titleForSegment(at: difficultyLevel.selectedSegmentIndex)!)
        welcome.text = "The sum is \(String(result.0)) \n and the product is \(String(result.1))!  Can you guess the factors?"
        firstFactor.text = ""
        secondFactor.text = ""
    }
    

        // Do any additional setup after loading the view, typically from a nib.
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var difficultyLevel: UISegmentedControl!
    @IBAction func guessButton(_ sender: UIButton) {
        
        if let textEntry = firstFactor.text {
            if let guess1 = Int(textEntry) {
                if let textsecond = secondFactor.text {
                    if let guess2 = Int(textsecond) {
                        welcome.text = game.checkGuess(guessOne: guess1, guessTwo: guess2)
                        scoreButton.text = "Score: \(game.score)"
                        if welcome.text == "You got it!" {
                            var result = game.playTheGame(difficulty: difficultyLevel.titleForSegment(at: difficultyLevel.selectedSegmentIndex)!)
                            welcome.text = "The sum is \(String(result.0)) \n and the product is \(String(result.1))!  Can you guess the factors?"
                            firstFactor.text = ""
                            secondFactor.text = ""
                        }
                        }
        }
                }

        }
        }
      //  if welcome.text == "You got it!" {
        //    playSound(named: "correct")
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






