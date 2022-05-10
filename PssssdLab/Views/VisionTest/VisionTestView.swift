//
//  VisionTestView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI
import ConfettiSwiftUI
import PopupView

struct VisionTestView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var game = VisionTestVM()
    
    var body: some View {
        ZStack {
            
            // MARK: Background color
            Color.custom(.PssssdBackgroundColor)
                .ignoresSafeArea(.all)
            
            // MARK: Body
            VStack(spacing: 20) {
                
                navBar
                
                if !game.isGameOver {
                    VStack {
                        Grid(game.dealedCards) { card in
                            VisionTestCard(card: card, gameOver: game.isGameOver)
                                .aspectRatio(1, contentMode: .fit)
                                .onTapGesture {
                                    withAnimation {
                                        game.select(card: card)
                                    }
                                }
                                .padding(5)
                        }
                        .accentColor(statusColor)
                    }
                
                } else {
                    
                    Spacer()
                    
                    Text(game.timeElapsed)
                        .font(Font.system(size: 70, design: .monospaced))
                        .fontWeight(.semibold)
                        .transition(.scale)
                    
                    Text("Time Elapsed")
                        .font(Font.system(size: 25, design: .monospaced))
                        .fontWeight(.semibold)
                        .transition(.scale)
                        .padding(.top, -10)
                    
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
                    
                    Text(game.isNewBestTiming ? "New Best Timing" : "Best Timing: \(convertSecondsToHrMinuteSec(seconds: game.visionBestTiming))")
                        .font(Font.system(size: 20, design: .monospaced))
                        .fontWeight(.semibold)
                        .transition(.scale)
                }
                
                
                if !game.isGameOver {
                    bottomBar
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
        .onChange(of: game.gameOver) { gameOver in
            game.endGame(isGameOver: gameOver)
        }
    }
    
    var navBar: some View {
        ZStack {
            HStack {
                // back button
                Button {
                    game.timer.invalidate()
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
                    
//                    // for testing game end
//                    game.endGame(isGameOver: !game.isGameOver)
                    
                } label: {
                    NavBarIcon(systemName: "arrow.counterclockwise.circle")
                }
                .disabled(game.gameOver)
                .opacity(game.gameOver ? 0 : 1)
            }
            
            // Title
            TitleBoard(title: "Vision Test")
        }
    }
    
    var bottomBar: some View {
        HStack {
            // Instructions button
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .light)
                impactMed.impactOccurred()
                game.showInstructions = true
            } label: {
                NavBarIcon(systemName: "questionmark.circle")
            }
            
            Spacer()
            
            // Deal-new-cards button
            Button {
                dealCards(3)
            } label: {
                CapsuleButton(text: "Deal 3 Cards", mainColor: Color.custom(.PsssdGreen), hPadding: 30)
            }
            .disabled(game.cardsInDeck < 1)
            .opacity(game.cardsInDeck < 1 ? 0 : 1)
        }
        .padding(.top, 10)
    }
    
    func dealCards(_ number: Int) {
        let impactMed = UIImpactFeedbackGenerator(style: .light)
        impactMed.impactOccurred()
        withAnimation {
            game.dealCards(number)
        }
    }
    
    func resetGame() {
        let impactMed = UIImpactFeedbackGenerator(style: .light)
        impactMed.impactOccurred()
        withAnimation {
            game.newGame()
        }
    }
    
    var statusColor: Color {
        switch game.matchingStatus {
        case .matching:
            return .yellow
        case .nonMatching:
            return Color.custom(.PssssdRed)
        case .none:
            return Color.custom(.PssssdBlue)
        }
    }

}

struct VisionTestView_Previews: PreviewProvider {
    static var previews: some View {
        VisionTestView()
    }
}
