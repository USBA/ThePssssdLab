//
//  SetGame.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-04.
//

import SwiftUI

struct SetGame {
    private(set) var deck = [Card]()
    private(set) var dealedCards = [Card]()
    private(set) var secondsElapsed: Int = 0
    private(set) var gameOver: Bool = false
    
    let instructions: [String] = [
        "Select all the 3 matching cards with the same shape on them. The colors of the matching cards are different even though the shape is the same.",
        "The deck contains a total of 81 unique cards. So there are 9 matching sets.",
        "You will initially be given 12 cards. You can add the remaining cards to the screen at your own pace by tapping on the \"Deal 3 Cards\" button.",
    ]
    
    init() {
        for shape in ContentShape.allCases {
            for number in ContentNumber.allCases {
                for color in ContentColor.allCases {
                    for shading in ContentShading.allCases {
                        let newCard = Card(shape: shape, number: number, color: color, shading: shading)
                        deck.append(newCard)
                    }
                }
            }
        }
        deck.shuffle()
    }
    
    mutating func incrementTimeBy1() {
        secondsElapsed += 1
    }
    
    var selectedCards: [Card] {
        dealedCards.filter({ $0.isSelected })
    }
    
    var isCardsMatching: Bool {
        let shapes = selectedCards.compactMap { card in
            return card.shape
        }
        let numbers = selectedCards.compactMap { card in
            return card.number
        }
        let shadings = selectedCards.compactMap { card in
            return card.shading
        }
        
        return Set(shapes).count == 1 && Set(numbers).count == 1 && Set(shadings).count == 1
    }
    
    mutating func select(card: Card) {
        if selectedCards.count > 2 {
            dealWithSelectedSet()
        }
        if let selectedCardIndex = dealedCards.firstIndex(of: card), !dealedCards[selectedCardIndex].isMatched  {
            dealedCards[selectedCardIndex].isSelected.toggle()
        }
        
        // cards are matching
        if selectedCards.count > 2 && isCardsMatching {
            let impactMed = UIImpactFeedbackGenerator(style: .soft)
            impactMed.impactOccurred()
            markSelectedCardsAsMatched()
        }
        
        if deck.isEmpty && dealedCards.filter({ !$0.isMatched }).isEmpty {
            // if all the cards are mathced, then the game is over
            gameOver = true
        }
    }
    
    mutating func dealWithSelectedSet() {
        if isCardsMatching {
            // remove matched chards and add new cards
            for card in selectedCards {
                if let index = dealedCards.firstIndex(of: card) {
                    dealedCards.remove(at: index)
                    drawACardFromDeck(to: index)
                }
            }
        } else {
            // deselect non-matching cards
            for index in dealedCards.indices {
                dealedCards[index].isSelected = false
            }
        }
    }
    
    private mutating func markSelectedCardsAsMatched() {
        for index in dealedCards.indices {
            if selectedCards.contains(where: {$0 == dealedCards[index]}) {
                dealedCards[index].isMatched = true
            }
        }
    }
    
    mutating func drawACardFromDeck(to index: Int? = nil) {
        if !deck.isEmpty {
            let newCard = deck.removeFirst()
            if let givenIndex = index {
                dealedCards.insert(newCard, at: givenIndex)
            } else {
                dealedCards.append(newCard)
            }
        }
    }
    
    struct Card: Identifiable, Equatable {
        let id = UUID()
        let shape: ContentShape
        let number: ContentNumber
        let color: ContentColor
        let shading: ContentShading
        
        var isSelected: Bool = false
        var isMatched: Bool = false
    }
    
    enum ContentShape: CaseIterable, Hashable {
        case radio
        case eye
        case exclamation
    }
    
    enum ContentNumber: Int, CaseIterable, Hashable  {
        case one = 1
        case two, three
    }
    
    enum ContentColor: CaseIterable, Hashable {
        case red
        case green
        case blue
    }
    
    enum ContentShading: CaseIterable, Hashable {
        case solid
        case striped
        case open
    }
}
