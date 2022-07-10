//
//  ViewController.swift
//  WarGame
//
//  Created by Shoval on 01/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var panel_LBL_score1: UILabel!
    @IBOutlet weak var panel_LBL_score2: UILabel!
    @IBOutlet weak var panel_IMG_player2: UIImageView!
    @IBOutlet weak var panel_IMG_player1: UIImageView!
    @IBOutlet weak var panel_LBL_games: UILabel!
    
    var cards: [UIImageView]!
    
    var score1:Int = 0
    var score2:Int = 0
    var gamesCount:Int = 0
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cards = [panel_IMG_player1, panel_IMG_player2]
    }

    @IBAction func buttonClicked(_ sender: Any) {
        if(gamesCount==0){
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            self.play()

            if gamesCount == 15 {
                timer.invalidate()
            }
        }
        }
    }
    
    func play() {
        let IMAGES = [#imageLiteral(resourceName: "king"), #imageLiteral(resourceName: "queen"), #imageLiteral(resourceName: "rook"), #imageLiteral(resourceName: "bishop"), #imageLiteral(resourceName: "knight"), #imageLiteral(resourceName: "pawn")]
        
        
        let rand_left = Int.random(in: 0 ..< IMAGES.count)
        cards[0].image = IMAGES[rand_left]
        let rand_right = Int.random(in: 0 ..< IMAGES.count)
        cards[1].image = IMAGES[rand_right]
        

        
        let winner = checkWin(rand_left, rand_right)
        
        gamesCount+=1
        panel_LBL_games.text = "\(gamesCount)/15"
        
    }
    
    func checkWin(_ left: Int, _ right: Int){
        
        let SCORES = [8,8,2,2,2,1]
        
        if(SCORES[left]>SCORES[right]){
            score1+=SCORES[left]
            
        }else if (SCORES[left]<SCORES[right]){
            score2+=SCORES[right]
        }else {
            score1+=SCORES[left]
            score2+=SCORES[right]
        }
        panel_LBL_score1.text = "\(score1)"
        panel_LBL_score2.text = "\(score2)"
    }
    
}

