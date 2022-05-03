//
//  BrainTestCardStyle.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI

struct BrainTestCardStyle: AnimatableModifier {
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation}
        set { rotation = newValue }
    }
    
    
    func body(content: Content) -> some View {
        ZStack {
            // MARK: Faced-Up Card
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            
            // MARK: Faced-Down Card
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.custom(.PsssdGreen))
                .overlay(
                    Image("PSSSSD-Logo")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.custom(.PssssdCardColor))
                        .padding(10)
                    
                )
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func brainTestCardStyle(isFaceUp: Bool) -> some View {
        self.modifier(BrainTestCardStyle(isFaceUp: isFaceUp))
    }
}
