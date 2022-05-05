//
//  VisionTestCard.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-04.
//

import SwiftUI

struct VisionTestCard: View {
    var card: SetGame.Card
    var gameOver: Bool
    
    var body: some View {
        GeometryReader { geometry in
            if !gameOver {
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color(UIColor.systemGray6))
                        .shadow(color: card.isSelected ? Color.accentColor.opacity(0.5) : Color.clear, radius: 5, x: -3, y: 3)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: card.isSelected ? 3 : 1)
                    cardContent
                        .padding(contentPadding)
                }
                .foregroundColor(card.isSelected ? .accentColor : .clear)
            }
        }
        .transition(.offset(randomOffset))
    }
    
    var cardContent: some View {
        VStack {
            ForEach(0..<card.number.rawValue, id: \.self) { _ in
                Group {
                    switch card.shape {
                    case .radio:
                        if card.shading == .open {
                            Image(systemName: "radio")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else if card.shading == .striped {
                            Image(systemName: "radio.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay(
                                    Image(systemName: "radio")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(contentColor)
                                )
                        } else {
                            Image(systemName: "radio.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    case .eye:
                        if card.shading == .open {
                            Image(systemName: "eye")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else if card.shading == .striped {
                            Image(systemName: "eye.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay(
                                    Image(systemName: "eye")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(contentColor)
                                )
                        } else {
                            Image(systemName: "eye.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    case .exclamation:
                        if card.shading == .open {
                            Image(systemName: "exclamationmark.triangle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else if card.shading == .striped {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay(
                                    Image(systemName: "exclamationmark.triangle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(contentColor)
                                )
                        } else {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
            }
        }
        .foregroundColor(contentColor.opacity(contentOpacity))
    }
    
    private var contentColor: Color {
        switch card.color {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
    
    private var contentOpacity: Double {
        return card.shading == .striped ? 0.3 : 1
    }
    
    var randomOffset: CGSize {
        let screenSize = UIScreen.main.bounds.size
        let multiplier: [CGFloat] = [-2, 2]
        let x: CGFloat = .random(in: 0..<screenSize.width) * multiplier.randomElement()!
        let y: CGFloat = .random(in: 0..<screenSize.height) * multiplier.randomElement()!
        
        return CGSize(width: x, height: y)
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    private var contentPadding: CGFloat {
        CGFloat(20 - (card.number.rawValue * 5))
    }
}
