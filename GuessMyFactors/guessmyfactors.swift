//
//  guessmyfactors.swift
//  GuessMyFactors
//
//  Created by Sreya Guha on 9/20/17.
//  Copyright © 2017 Sreya Guha. All rights reserved.
//

import Foundation
class GTFGame {
    var firstNumber = 0
    var secondNumber = 0
    var score = 0
    var difficulty = "easy"
    
    func generateEasyNumbers() -> (Int, Int) {
        firstNumber = Int(arc4random_uniform(7) + 5)
        secondNumber = Int(arc4random_uniform(7) + 5)
        return (firstNumber + secondNumber, firstNumber * secondNumber)
    }
    func generateHardNumbers() -> (Int, Int) {
        firstNumber = Int(arc4random_uniform(7) + 10)
        secondNumber = Int(arc4random_uniform(7) + 10)
        return (firstNumber + secondNumber, firstNumber * secondNumber)
    }
    
    func generateSum(firstNumber: Int, secondNumber: Int) -> Int {
        return (firstNumber + secondNumber)
    }
    
    
    func generateProduct(firstNumber: Int, secondNumber: Int) -> Int {
        return (firstNumber * secondNumber)
    }
    
    
    func getUserGuess(sum: Int, product:Int ) -> (String) {
        print ("The sum is " + String(sum) + " and the product is " + String(product))
        print ("Guess both factors divided by a comma (no spaces)")
        let guessone = readLine()
        if let guessone = guessone {
            return (guessone)
        }
        return ("0, 0")
    }
    
    
    func checkGuess(guessOne:Int, guessTwo: Int ) -> String {
     //   var guess = getUserGuess(sum: sum, product: product).components(separatedBy: ",")
        var scoreVar = false
        if (guessOne == firstNumber) && (guessTwo == secondNumber) {
            score = score + 1
            return ("You got it!")
        }else if (guessOne == secondNumber) && (guessTwo == firstNumber){
            score = score + 1
            return ("You got it!")
            
        } else {
            return "Hmmm. That's not quite right. Try again! The sum is \(String(firstNumber + secondNumber)) and the product is  \(String(firstNumber * secondNumber))! Guess the factors!"
            
        }
        
    }

    func playAgain() -> String {
        print ("Do you want to play again? Enter y or n: ")
        let answer = readLine()
        if let answer = answer {
            if (answer.lowercased() != "y") {
                return "n"
            } else {
                return "y"
                
                
            }
        }
        return "n"
    }
    
    func playTheGame (difficulty: String) -> (Int, Int) {
        if difficulty == "Easy" {
            return generateEasyNumbers()
        } else if difficulty == "Hard" {
            return generateHardNumbers()
        } else {
            return generateEasyNumbers()
        }
        
    }
        
      //  return (numbers.0,numbers.1, generateSum(firstNumber: numbers.0, secondNumber: numbers.1), generateProduct(firstNumber: numbers.0, secondNumber: numbers.1))
        
    
    
        
      //  let sum = generateSum(firstNumber: numbers.0, secondNumber: numbers.1)
        //let product = generateProduct(firstNumber: numbers.0, secondNumber: numbers.1)
     //   return [[numbers.0], [numbers.1], sum, product]
//        var play = "y"
//        while (play == "y"){
//            let numbers = generateFirstNumber()
//            let sum = generateSum(firstNumber: numbers.0, secondNumber: numbers.1)
//            let product = generateProduct(firstNumber: numbers.0, secondNumber: numbers.1)
//            checkGuess(sum:sum, product: product, firstNumber: numbers.0, secondNumber: numbers.1)
//            
//            play = playAgain()
//            
//        }
//        print ("Good bye")
//        
//    }
    
}

