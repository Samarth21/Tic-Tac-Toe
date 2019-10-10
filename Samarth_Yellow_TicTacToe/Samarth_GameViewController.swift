//
//  Samarth_GameViewController.swift
//  Samarth_Yellow_TicTacToe
//
//  Created by Samarth Patel on 2019-06-12.
//  Copyright © 2019 Samarth Patel. All rights reserved.
//

import UIKit

class Samarth_GameViewController: UIViewController {

    //MARK: Properties
    var gameModel = Samarth_GameModel()
    var acceptNewTouches = true
    
    var isPastGame = false
    var orderOfMoves : [Int]?
    
    //MARK: Outlets
    
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if (isPastGame) {
            acceptNewTouches = false
            gameModel.isPastGame = true
            // replay the moves in the order they are played
            var delay = 0.0
            for move in orderOfMoves! {
                delay += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute:
                    {self.playMove(move)})
            }
        } else {
            // do nothing, carry on
        }
    }
    
    //MARK: Touch events on buttons
    
    @IBAction func squareTouched(_ sender: UIButton) {
        
        print("button touched")
        print(sender.tag)
        
        if (sender.currentTitle == nil && acceptNewTouches) {
            playMove(sender.tag)
        } else {
            
        }
    }
    
    func playMove(_ tag: Int) {
        let currentButton = view.viewWithTag(tag) as! UIButton
        currentButton.setTitle(gameModel.whoseTurnIsIt, for: .normal)
        gameModel.playMove(tag: tag)
        
        if(gameModel.checkIfGameIsOver()) {
            gameStatusLabel.text = gameModel.gameResult
            acceptNewTouches = false
        } else {
            gameStatusLabel.text = gameModel.whoseTurnIsIt + "'s Turn"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
