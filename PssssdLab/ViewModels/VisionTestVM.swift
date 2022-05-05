//
//  VisionTestVM.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-04.
//

import SwiftUI

class VisionTestVM: ObservableObject {
    @Published private var model: SetGame = SetGame()
    let initialCardsCount = 12
    
    @Published private(set) var isGameOver = false
    @Published private(set) var isNewBestTiming = false
    
    @Published var confettiCounter = 0
    @Published var showTestSubjectUnlockPopup = false
    @Published var showInstructions = false
    
    @AppStorage("visionBestTiming") var visionBestTiming = 0
    
    var timer = Timer()
    
    init() {
        newGame()
    }
    
    
    // MARK: - Access to the model
    
    var instructions: [String] {
        model.instructions
    }
    
    var deck: [SetGame.Card] {
        model.deck
    }
    
    var dealedCards: [SetGame.Card] {
        model.dealedCards
    }
    
    var cardsInDeck: Int {
        model.deck.count
    }
    
    var secondsElapsed: Int {
        model.secondsElapsed
    }
    
    var timeElapsed: String {
        convertSecondsToHrMinuteSec(seconds: secondsElapsed)
    }
    
    var gameOver: Bool {
        model.gameOver
    }
    
    var matchingStatus: MatchingStatus {
        if model.selectedCards.count > 2 {
            if model.isCardsMatching {
                return .matching
            } else {
                return .nonMatching
            }
        } else {
            return .none
        }
    }
    
    // MARK: - Intent(s)
    
    func select(card: SetGame.Card) {
        model.select(card: card)
    }
    
    func dealCards(_ number: Int) {
        if matchingStatus == .matching {
            model.dealWithSelectedSet()
        } else {
            for _ in 0..<number {
                model.drawACardFromDeck()
            }
        }
    }
    
    func newGame() {
        timer.invalidate()
        model = SetGame()
        dealCards(initialCardsCount)
        self.isNewBestTiming = false
        
        // calculate the time
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if !self.gameOver {
                self.model.incrementTimeBy1()
                print("time is: \(self.secondsElapsed)")
            } else {
                timer.invalidate()
            }
        }
    }
    
    func endGame(isGameOver: Bool) {
        if isGameOver {
            timer.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring()) {
                    self.isGameOver = true
                    // set new best-timing
                    if self.visionBestTiming == 0 || (self.secondsElapsed < self.visionBestTiming) {
                        self.visionBestTiming = self.secondsElapsed
                        self.isNewBestTiming = true
                    }
                }
                self.confettiCounter += 1
            }
        } else {
            withAnimation(.spring()) {
                self.isGameOver = false
                self.isNewBestTiming = false
            }
        }
    }
}

enum MatchingStatus {
    case matching
    case nonMatching
    case none
}
