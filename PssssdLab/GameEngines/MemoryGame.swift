//
//  MemoryGame.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    private(set) var gameOver: Bool = false
    
    private var indexOfTheOneAndOnlyFacedUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFacedUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(of: card), !cards[chosenIndex].isFacedUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // cards matched
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    // mismatch
                    score -= (cards[chosenIndex].hasSeen ? 1 : 0)
                    score -= (cards[potentialMatchIndex].hasSeen ? 1 : 0)
                }
                self.cards[chosenIndex].isFacedUp = true
                self.cards[chosenIndex].hasSeen = true
                self.cards[potentialMatchIndex].hasSeen = true
            } else {
                indexOfTheOneAndOnlyFacedUpCard = chosenIndex
            }
        }
        
        if cards.filter({ !$0.isMatched }).isEmpty {
            // if all the cards are mathced, then the game is over
            gameOver = true
        }
        
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable {
        var isFacedUp: Bool = false {
            didSet {
                if isFacedUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatched: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        
        var hasSeen: Bool = false
        
        var content: CardContent
        var id: Int
        
        
        
        // MARK: - Bonus Time
        
        var bonusTimeLimit: TimeInterval = 6
        
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        var lastFaceUpDate: Date?
        
        var pastFaceUpTime: TimeInterval = 0
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            isFacedUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
        
    }
    
    
}
