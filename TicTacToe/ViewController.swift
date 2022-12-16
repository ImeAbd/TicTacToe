//
//  ViewController.swift
//  TicTacToe
//
//  Created by Imran Abdurrauf on 2022-12-05.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1 //Cross is default
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // board
    // Keeps track of Where we have placed What. This is an array, if nothing has been placed yet it is going to place 0.
    
    let winningComb = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    //Possible winning combination
    
    var gameIsActive = true // Able to set the game at paus
    
    @IBOutlet weak var label: UILabel!
    @IBAction func actionButton(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1] == 0) && gameIsActive == true
        // Reason for being -1, the array starts at 0, and our tag starts at 1, so -1 equals to 0.
        {
            gameState[sender.tag-1] = currentPlayer
            
            if (currentPlayer == 1)
            {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                currentPlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "nought.png"), for: UIControl.State())
                currentPlayer = 1
            }
        }
        
        for combination in winningComb
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination [1]] == gameState[combination[2]]
                
                //Checks first if currentPlayer is not zero (either 1 or 2). Then checks whether the second element is equal to the first element, and then if the third element is equal to the second element. If it is true, then currentPlayer 1 or 2 has won.
                
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "CROSS is the Winner!"
                }
                else
                {
                    label.text = "NOUGHT is the Winner!"
                }
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        var count = 1
        
        if gameIsActive == true{
            for i in gameState{
                count = i*count
            }
            if count != 0
            {
                label.text = "DRAW"
                label.isHidden = false
                playAgainButton.isHidden = false
                // Makes sure you cannot continue playing after game is won.
            }
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        currentPlayer = 1
        //resets the tiles on the board and back to default players turn (Cross)
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton // searches for i with tag from 1-9
            
            //button.setImage(nil, for: .normal)    ------Code did not work---------
            
            button.setImage(UIImage(named: "playAgainBlank.png"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}


    
