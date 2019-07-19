//
//  ViewController.swift
//  Card_Pair
//
//  Created by sunny on 2019/3/20.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        random()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var emojiChoices = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    var count: Int = 0{
        didSet{
            flipCountLabel.text = String("\(count)")
        }
    }

    @IBOutlet var cardButton: [UIButton]!
    
    @IBAction func tourchCards(_ sender: UIButton) {
        if let cardNumber = cardButton.index(of: sender)
        {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else {
            print("not the current collection")
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func reset(_ sender: UIButton) {
        for index in self.cardButton{
            index.setTitle("🖕🏿", for: .normal)
            index.backgroundColor = #colorLiteral(red: 0, green: 0.507977128, blue: 0, alpha: 1)
        }
        count = 0
    }
    
    
    @IBAction func flip_all(_ sender: UIButton) {
        random()
        for button in self.cardButton{
            let index = cardButton.index(of: button)
            button.setTitle(emojiChoices[index!], for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.4189639098, blue: 0.3305173472, alpha: 1)
        }
    }
    
    private func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("🖕🏿", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.507977128, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.4189639098, blue: 0.3305173472, alpha: 1)
        }
        count += 1
    }
    
    private func random(){
        emojiChoices.shuffle()
    }
    
}

