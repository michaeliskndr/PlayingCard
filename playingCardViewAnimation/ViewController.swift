//
//  ViewController.swift
//  playingCardViewAnimation
//
//  Created by Michael Iskandar on 30/06/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var deck = PlayingCardDeck()
    @IBOutlet var playingCardViews: [PlayingCardView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cards = [PlayingCard]()
        
        for _ in 1...(playingCardViews.count + 1 / 2) {
            let card = deck.draw()!
            cards += [card, card]
        }
        
        for cardView in playingCardViews {
            cardView.isFaceUp = false
            let card = cards.remove(at: cards.count.arc4random)
            cardView.rank = card.rank.order
            cardView.suit = card.suit.rawValue
            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_ :))))
            
        }
        // Do any additional setup after loading the view.
    }
    private var faceUpCardViews: [PlayingCardView] {
        return playingCardViews.filter { $0.isFaceUp && !$0.isHidden        }
    }
    
    @objc func flipCard(_ recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            if let chosenCardView = recognizer.view as? PlayingCardView {
                UIView.transition(with: chosenCardView,
                                  duration: 0.6,
                                  options: [.transitionFlipFromLeft],
                                  animations: {
                                    chosenCardView.isFaceUp = !chosenCardView.isFaceUp
                                    
                                  },
                                  completion: { finished in
                                    if self.faceUpCardViews.count >= 2 {
                                        self.faceUpCardViews.forEach { cardView in
                                            UIView.transition(with: cardView,
                                                              duration: 0.6,
                                                              options: [.transitionFlipFromLeft],
                                                              animations: {
                                                                cardView.isFaceUp = !cardView.isFaceUp
                                            })
                                        }
                                    }
                                  })
                
            }
        default:
            break
        }
        
    }
    
    
}

