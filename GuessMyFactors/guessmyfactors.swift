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
    
    func generateNumbers() -> (Int, Int) {
        firstNumber = Int(arc4random_uniform(5) + 7)
        secondNumber = Int(arc4random_uniform(5) + 7)
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
        if (guessOne == firstNumber) && (guessTwo == secondNumber) {
            return ("You got it!")
        }else if (guessOne == secondNumber) && (guessTwo == firstNumber){
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
    
    
    func playTheGame () -> (Int, Int) {
        let result = generateNumbers()
        return result
        
      //  return (numbers.0,numbers.1, generateSum(firstNumber: numbers.0, secondNumber: numbers.1), generateProduct(firstNumber: numbers.0, secondNumber: numbers.1))
        
    }
    
        
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

