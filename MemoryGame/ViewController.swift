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
    
    var userName     = ""
    var emoticons    = ["😎", "🤓", "😎", "😇", "😇", "🤓", "😆", "😆", "👹", "👹", "👻", "👻"].shuffled()
    var moves        = 0
    var points       = 0
    var foundedCards = [false, false, false, false, false, false, false, false, false, false, false, false]
    var cardPosition: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let label = titleLabel {
            label.text = userName
            setDefault()
        }
        
        self.navigationController?.isNavigationBarHidden = false
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
                            points += 2
                        } else {
                            points = points - 1
                        }
                        
                    } else {
                        cardPosition = index
                    }
                }
                movesLabel.text = "Pontos: \(points)"
                
                if didFinishedGame() {
                    showGameOverAlert()
                }
            }
        }
    }
    
    func showGameOverAlert() {
        let alert = UIAlertController(title: "Parabéns", message: "Você concluiu o jogo com \(points) pontos", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Jogar novamente", style: .default, handler: { (action) in
            self.initalSetup()
            self.setDefault()
        }))
        
        alert.addAction(UIAlertAction(title: "Voltar para tela principal", style: .cancel, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    func initalSetup() {
        self.moves        = 0
        self.points       = 0
        self.foundedCards = [false, false, false, false, false, false, false, false, false, false, false, false]
        self.movesLabel.text = "Pontos: \(self.points)"
        self.cardPosition = nil
    }
    
    func didFinishedGame() -> Bool{
        return foundedCards == [true, true, true, true, true, true, true, true, true, true, true, true]
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

