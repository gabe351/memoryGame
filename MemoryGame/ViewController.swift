//
//  ViewController.swift
//  MemoryGame
//
//  Created by Gabriel Rosa on 13/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    
    
    var userName      = ""
    let emoticons    = ["😎", "🤓", "😎", "🤓"]
    var moves        = 0
    var foundedCards = [false, false, false, false]
    var cardPosition: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let label = titleLabel {
            label.text = userName
            setDefault()
        }
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func buttonDidTapped(_ sender: UIButton) {
        checkCards()
        
        
        for index in cards.indices {
            if sender == cards[index] {
                if !foundedCards[index] {
                    moves += 1
                    sender.setTitle(emoticons[index], for: .normal)
                    sender.backgroundColor = UIColor.green
                    sender.isUserInteractionEnabled = false
                    if let position = cardPosition {
                        let firstCard  = cards[position]
                        let secondCard = cards[index]
                        if firstCard.titleLabel?.text == secondCard.titleLabel?.text {
                            foundedCards[index]    = true
                            foundedCards[position] = true
                        }
                        
                    } else {
                        cardPosition = index
                    }
                }
                
                
            }
        }
    }
    
    func setDefault() {
        for index in cards.indices {
            
            if !foundedCards[index] {
                cards[index].backgroundColor = UIColor.blue
                cards[index].setTitle("", for: .normal)
                cards[index].isUserInteractionEnabled = true
            }
        }
    }
    
    func checkCards() {
        if moves >= 2 {
            moves = 0
            cardPosition = nil
            setDefault()
        }
    }
}

