//
//  BrainTestView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI
import ConfettiSwiftUI
import PopupView

struct BrainTestView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var game = BrainTestVM()
    
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
                    .foregroundColor(Color.custom(.PssssdRed))
                } else {
                    Spacer()
                }
                
                ZStack {
                    if !game.isGameOver {
                        HStack {
                            // instructions button
                            Button {
                                let impactMed = UIImpactFeedbackGenerator(style: .light)
                                impactMed.impactOccurred()
                                game.showInstructions = true
                            } label: {
                                NavBarIcon(systemName: "questionmark.circle")
                            }
                            
                            Spacer()
                        }
                    }
                    
                    // Score
                    Text("\(game.score)")
                        .font(Font.system(size: 35, design: .monospaced))
                        .fontWeight(.semibold)
                        .scaleEffect(game.isGameOver ? 3 : 1)
                }
                
                if game.isGameOver {
                    Text("Score")
                        .font(Font.system(size: 25, design: .monospaced))
                        .fontWeight(.semibold)
                        .transition(.scale)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    ZStack{
                        // New Game button
                        Button {
                            resetGame()
                        } label: {
                            CapsuleButton(text: "New Game", mainColor: Color.custom(.PsssdGreen))
                                .transition(.scale)
                        }
                        
                        // Confetti Cannon
                        ConfettiCannon(counter: $game.confettiCounter, num: 50, radius: 500)
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
        // instructions sheet
        .popup(isPresented: $game.showInstructions, type: .default, position: .bottom, animation: .spring(response: 0.4, dampingFraction: 0.7), dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, backgroundColor: Color.black.opacity(0.3)) {
            DescriptionCard(title: "INSTRUCTIONS", descriptions: game.instructions)
                .padding(40)
                .opacity(game.showInstructions ? 1 : 0)
        }
        // test-subject-unlocked notification
        .popup(isPresented: $game.showTestSubjectUnlockPopup, type: .floater(), position: .top, animation: .spring(response: 0.4, dampingFraction: 0.7), autohideIn: 5, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: false) {
            PopupTestSubjectUnlocked(testSubject: TestSubject(videoName: "TestSubject10"))
                .opacity(game.showTestSubjectUnlockPopup ? 1 : 0)
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
                    
                    // for testing game end
                    //game.endGame(isGameOver: !game.isGameOver)
                    
                } label: {
                    NavBarIcon(systemName: "arrow.counterclockwise.circle")
                }
                .disabled(game.gameOver)
                .opacity(game.gameOver ? 0 : 1)
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
