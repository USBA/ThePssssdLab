//
//  BrainTestCard.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI

struct BrainTestCard: View {
    var card: MemoryGame<String>.Card
    var gameOver: Bool
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            if !gameOver && (card.isFacedUp || !card.isMatched) {
                ZStack {
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default, value: card.isMatched)
                }
                .brainTestCardStyle(isFaceUp: card.isFacedUp)
                .transition(.scale)
            }
        }
    }
    
    // MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct BrainTestCard_Previews: PreviewProvider {
    static var previews: some View {
        BrainTestCard(card: MemoryGame<String>.Card(content: "🧪", id: 2), gameOver: false)
    }
}
