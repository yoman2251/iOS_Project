//
//  ViewController.swift
//  CardMatchingGame
//
//  Created by sunny on 2019/3/21.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cardButtons.shuffle()
        emoji_type.shuffled()
    }
    var time :Int = 0
    var numberOfPairsCard: Int {
        return (cardButtons.count+1)/2
    }
    
    var emoji_1 = ["😀","😃","😄","😁","😆","😊","🙂","😌"]
    var emoji_2 = ["👴","🧔","🧓","👨‍🦰","👨‍🦳","👨","🧑","👦"]
    var emoji_3 = ["🌤","⛅️","🌥","🌦","⛈","🌨","🌧","🌩"]
    var emoji_4 = ["🕑","🕒","🕓","🕙","🕘","🕗","🕔","🕜"]
    var emoji_5 = ["🇷🇺","🇧🇬","🇨🇷","🇦🇹","🇹🇭","🇳🇱","🇪🇪","🇸🇱"]
    var emoji_6 = ["👩‍👧‍👦","👩‍👦‍👦","👩‍👧‍👧","👨‍👧‍👦","👨‍👦‍👦","👨‍👧‍👧","👪","👨‍👩‍👧"]
    lazy var emojiChoices = [emoji_1, emoji_2, emoji_3, emoji_4, emoji_5, emoji_6]
    lazy var emoji_type = emojiChoices.shuffled()
    lazy var temp = emoji_type
    var emoji = Dictionary<Int, String>()
    lazy var game:MatchingGame = MatchingGame(numberOfPairsOfCards: numberOfPairsCard)
    
    var flipCount:Int = 0
    {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var score:Int = 0
    {
        didSet {
            ScoreLabel.text = "Score : \(score)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            flipCount = game.chooseCard(at: cardNumber)
            score = game.getScore()
            updateViewFromModel()
        }else {
            print("not in the collection")
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func FlipAll(_ sender: UIButton) {
        
        if time % 2 == 0 {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                game.flipAll()
                button.setTitle(getEmoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.5596104452)
            }
            time += 1
        }else {
            for index in self.cardButtons{
                index.setTitle("🤡", for: .normal)
                index.backgroundColor = #colorLiteral(red: 0.9947330356, green: 1, blue: 0.6175877452, alpha: 1)
                game.reset()
            }
            time += 1
        }
        flipCount = game.getFlipCount()
        score = game.getScore()
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        for index in self.cardButtons{
            index.setTitle("🤡", for: .normal)
            index.backgroundColor = #colorLiteral(red: 0.9947330356, green: 1, blue: 0.6175877452, alpha: 1)
        }
        game.reset()
        cardButtons.shuffle()
        self.emoji = [Int:String]()
        emoji_type = temp
        flipCount = game.getFlipCount()
        score = game.getScore()
        time = 0
        emoji_type = emojiChoices.shuffled()
    }

    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                if card.isMatched {
                    button.setTitle(getEmoji(for: card), for: .normal)
                    button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.5596104452)
                }
            }
            else {
                button.setTitle("🤡", for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9947330356, green: 1, blue: 0.6175877452, alpha: 1)
                if card.isMatched {
                    button.setTitle(getEmoji(for: card), for: .normal)
                    button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.5596104452)
                }
                
            }
        }
    }
    
    private func getEmoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emoji_type[0].count > 0 {
            let randomIndex =  Int(arc4random_uniform(UInt32(emoji_type[0].count)))
            
            emoji[card.identifier] = emoji_type[0].remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

