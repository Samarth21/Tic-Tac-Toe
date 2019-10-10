//
//  Samarth_GameModel.swift
//  Samarth_Yellow_TicTacToe
//
//  Created by Samarth Patel on 2019-06-12.
//  Copyright © 2019 Samarth Patel. All rights reserved.
//

import Foundation

class Samarth_GameModel{
    //MARK: Properties
    var whoseTurnIsIt = "X"
    var numberOfMovesPlayed = 0
    var checkFor = "O"
    var gameResult = ""
    
    var isPastGame = false
    
    var movesPlayed = Array(repeating: "", count: 9)
    
    var orderOfMoves = [Int]()
    
    let winningCombinations = [
        
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]]
    
    //MARK: Methods
    func playMove(tag: Int) {
        
        numberOfMovesPlayed += 1
        
        orderOfMoves.append(tag)
        
        movesPlayed[tag - 1] = whoseTurnIsIt
        
        if (whoseTurnIsIt == "X") {
            whoseTurnIsIt = "O"
            checkFor = "X"
        } else {
            whoseTurnIsIt = "X"
            checkFor = "O"
        }
    }
    
    func checkIfGameIsOver() -> Bool {
        if (numberOfMovesPlayed < 5) {
            return false
        }
        
        for i in 0..<8 {
            let winningCombo = winningCombinations[i]
            
            if (movesPlayed[winningCombo[0] - 1] == checkFor
                && movesPlayed[winningCombo[1] - 1] == checkFor
                && movesPlayed[winningCombo[2] - 1] == checkFor) {
                // Game is Over
                // checkFor has Won
                gameResult = checkFor + " Won!"
                saveGame()
                return true
            }
        }
        if (numberOfMovesPlayed == 9) {
            gameResult = "Draw"
            saveGame()
            return true
        }
        
        return false
    }
    
    func saveGame() {
        // Save the game information
        if (isPastGame) {
            return
        }
        
        var numberOfGamesPlayed = UserDefaults.standard.integer(forKey: "numberOfGamesPlayed")
        
        numberOfGamesPlayed += 1
        
        UserDefaults.standard.set(numberOfGamesPlayed, forKey: "numberOfGamesPlayed")
        
        UserDefaults.standard.set(gameResult, forKey: "Result_" + String(numberOfGamesPlayed))
        
        let currentTime = Date().timeIntervalSince1970
        
        UserDefaults.standard.set(currentTime, forKey: "TimeStamp_" + String(numberOfGamesPlayed))
        
        UserDefaults.standard.set(orderOfMoves, forKey: "OrderOfMoves_" + String(numberOfGamesPlayed))
        
    }
    }

