//
//  EmojiMemoryGame.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let items = ["🧪", "🔬", "🥼", "🥽", "💉", "🧬"]
    static let numberOfPairs = 6
    
    @Published private var model: MemoryGame<String>
    
    @Published private(set) var isGameOver = false
    @Published private(set) var isNewHighScore = false
    
    @AppStorage("brainTestHighScore") var brainTestHighScore = 0
    
    // MARK: - Assignment 5
    init() {
        let newGame =  MemoryGame<String>(numberOfPairsOfCards: EmojiMemoryGame.numberOfPairs) { pairIndex in
            return EmojiMemoryGame.items[pairIndex]
        }
        model = newGame
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var gameOver: Bool {
        model.gameOver
    }
    
    
    // MARK: - Intent(s)
    
    func chose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        let newGame =  MemoryGame<String>(numberOfPairsOfCards: EmojiMemoryGame.numberOfPairs) { pairIndex in
            return EmojiMemoryGame.items[pairIndex]
        }
        model = newGame
    }
    
    func endGame(isGameOver: Bool) {
        if isGameOver {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring()) {
                    self.isGameOver = true
                    // set new high-score
                    if self.score > self.brainTestHighScore {
                        self.brainTestHighScore = self.score
                        self.isNewHighScore = true
                    }
                }
            }
        } else {
            withAnimation(.spring()) {
                self.isGameOver = false
                self.isNewHighScore = false
            }
        }
    }
    
}
