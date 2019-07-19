//
//  MatchingGame.swift
//  CardMatchingGame
//
//  Created by sunny on 2019/3/21.
//  Copyright © 2019 sunny. All rights reserved.
//

import Foundation

class MatchingGame {
    var cards: Array<Card> = Array()
    //var cards = [Card]()
    
    private var flipCount: Int = 0
    private var score: Int = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
                if index == newValue {
                    cards[index].times += 1
                }
            }
        }
    }
    
    func chooseCard(at index: Int) -> Int{
        if !cards[index].isMatched { //已matched過的牌不作用
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    cards[matchIndex].times = 0
                    cards[index].times = 0
                    score = score + 2
                } //matched
                cards[index].times += 1
                cards[index].isFaceUp = true
                if cards[index].isFaceUp == true && cards[index].isMatched == false && cards[index].times > 1 {
                    score = score - 1
                }
                if cards[matchIndex].isFaceUp == true && cards[matchIndex].isMatched == false && cards[matchIndex].times > 1 {
                    score = score - 1
                }

            } // has another previous card face up
            //點在已翻開的唯一牌上會翻回去
            else if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex == index{
                cards[index].isFaceUp = false
                if cards[index].times > 1 {
                    score = score - 1
                }
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else {
                indexOfOneAndOnlyFaceUpCard = index
            }
            flipCount += 1
        }
        return flipCount
    }
    
    init(numberOfPairsOfCards: Int) {
        for index in 1...numberOfPairsOfCards {
            let card = Card(identifier: index)
            cards += [card, card]
        }
    }
    
    func  reset() {
        for index in cards.indices{
            cards[index].isMatched = false
            cards[index].isFaceUp = true
            cards[index].times = 0
        }
        score = 0
        flipCount = 0
    }
    
    func  flipAll() {
        for index in cards.indices{
            cards[index].isMatched = true
            cards[index].isFaceUp = false
        }
    }
    
    public func getFlipCount() -> Int {
        return flipCount
    }
    
    public func getScore() -> Int {
        return score
    }
    
}
