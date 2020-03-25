//
//  JEFCardViewController.swift
//  DeckOfOneCard
//
//  Created by Jordan Furr on 3/24/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit

class JEFCardViewController: UIViewController {
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var cardimage: UIImageView!
    @IBAction func drawnew(_ sender: Any) {
        self.fetchCards()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCards()
    }
    
    func fetchCards(){
        JEFCardController.drawANewCard(1) { (cards) in
            if let cards = cards {
                JEFCardController.fetchCardImage(cards[0]) { (cardImage) in
                    DispatchQueue.main.async {
                        if let cardImage = cardImage {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    func updateViews(card: JEFCard, image: UIImage){
        self.cardimage.image = image
        self.namelabel.text = card.suit

        switch card.suit {
        case "DIAMONDS":
            self.namelabel.textColor = .red
        case "HEARTS":
           // self.drawCardButton.backgroundColor = .systemRed
             self.namelabel.textColor = .red
        case "SPADES":
          //  self.drawCardButton.backgroundColor = .black
            self.namelabel.textColor = .black
        case "CLUBS":
         //   self.drawCardButton.backgroundColor = .black
            self.namelabel.textColor = .black
        default:
            break
        }
    }
}
