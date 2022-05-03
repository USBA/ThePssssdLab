//
//  BrainTestView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI

struct BrainTestView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var game = EmojiMemoryGame()
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
    ]
    
    var body: some View {
        ZStack {
            
            // MARK: Background color
            Color.custom(.PssssdBackgroundColor)
                .ignoresSafeArea(.all)
            
            // MARK: Body
            VStack(spacing: 20) {
                
                navBar
                
                if !game.isGameOver {
                // Cards
                Grid(game.cards) { card in
                    BrainTestCard(card: card, gameOver: game.isGameOver)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.75)) {
                                game.chose(card: card)
                            }
                        }
                        .padding(5)
                }
                .foregroundColor(Color.custom(.PsssdGreen))
                } else {
                    Spacer()
                }
                
                // Score
                Text("\(game.score)")
                    .font(Font.system(size: 35, design: .monospaced))
                    .fontWeight(.semibold)
                    .scaleEffect(game.isGameOver ? 3 : 1)
                
                if game.isGameOver {
                    Text("Score")
                        .font(Font.system(size: 25, design: .monospaced))
                        .fontWeight(.semibold)
                        .transition(.scale)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    // New Game button
                    Button {
                        resetGame()
                    } label: {
                        CapsuleButton(text: "New Game", mainColor: Color.custom(.PsssdGreen))
                            .transition(.scale)
                    }
                    
                    Spacer()
                    
                    Text(game.isNewHighScore ? "New High Score" : "High Score: 20")
                        .font(Font.system(size: 20, design: .monospaced))
                        .fontWeight(.semibold)
                        .transition(.scale)
                }
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .onChange(of: game.gameOver) { gameOver in
            game.endGame(isGameOver: gameOver)
        }
    }
    
    var navBar: some View {
        ZStack {
            HStack {
                // back button
                Button {
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    NavBarIcon(systemName: "arrow.backward.circle")
                }
                
                Spacer()
                
                // reset button
                Button {
                    resetGame()
                } label: {
                    NavBarIcon(systemName: "arrow.counterclockwise.circle")
                }
            }
            
            // Title
            TitleBoard(title: "Brain Test")
        }
    }
    
    func resetGame() {
        let impactMed = UIImpactFeedbackGenerator(style: .light)
        impactMed.impactOccurred()
        withAnimation(.easeInOut) {
            game.resetGame()
        }
    }
}

struct BrainTestView_Previews: PreviewProvider {
    static var previews: some View {
        BrainTestView()
    }
}
