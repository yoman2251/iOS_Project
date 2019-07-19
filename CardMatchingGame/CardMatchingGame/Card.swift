//
//  Card.swift
//  CardMatchingGame
//
//  Created by sunny on 2019/3/21.
//  Copyright © 2019 sunny. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var times: Int = 0
    var identifier: Int = 0     //uae ID, not emoji
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() ->Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier: Int) {
        self.identifier = Card.getUniqueIdentifier()
    }
}
