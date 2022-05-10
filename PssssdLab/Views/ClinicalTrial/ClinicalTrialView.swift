//
//  ClinicalTrialView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI
import AVFoundation
import VideoPlayer
import AVKit
import SpriteKit

struct ClinicalTrialView: View {
    @Environment(\.presentationMode) var presentationMode
    var testSubject: TestSubject
    
    @State var play = true
    @State var isPossessed = false
    @State var showGas = false

    var body: some View {
        ZStack {
            
            // MARK: Background color
            Color.custom(.PssssdBackgroundColor)
                .ignoresSafeArea(.all)
            
            // MARK: Body
            VStack(spacing: 15) {
                
                navBar
                    .padding()
                
                Spacer()
                
                VStack(spacing: 5) {
                    HStack {
                        Nail(rotationDegree: 110)
                        Spacer()
                        Nail(rotationDegree: 344)
                    }
                    
                    LabWindow(testSubject: testSubject, play: $play, isPossessed: $isPossessed, showGas: $showGas)
                        .padding()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                play = false
                            }
                        }
                    
                    HStack {
                        Nail(rotationDegree: 24)
                        Spacer()
                        Nail(rotationDegree: 126)
                    }
                }
                .padding()
                
                Spacer()
                
                ControlPanel(play: $play, isPossessed: $isPossessed, showGas: $showGas)

            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
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
            }
            
            // Title
            TitleBoard(title: "Clinical Trial")
        }
    }
    
}

struct ClinicalTrialView_Previews: PreviewProvider {
    static var previews: some View {
        ClinicalTrialView(testSubject: TestSubject(videoName: "TestSubject2"))
    }
}

struct LabWindow: View {
    var testSubject: TestSubject
    @Binding var play: Bool
    @Binding var isPossessed: Bool
    @Binding var showGas: Bool
    
    var body: some View {
        ZStack {
        VideoPlayer(url: Bundle.main.url(forResource: testSubject.videoName, withExtension: "mp4")!, play: $play)
            .autoReplay(true)
            .aspectRatio(contentMode: .fit)
            .overlay(
                GasView(isPossessed: $isPossessed, showGas: $showGas)
            )
        }
            .clipShape(RoundedRectangle(cornerRadius: 7.5))
            .overlay(
                RoundedRectangle(cornerRadius: 7.5).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 15)
                    .shadow(color: Color.black.opacity(0.5), radius: 0, x: 6, y: 7)
                    .shadow(color: Color.black.opacity(0.5), radius: 0, x: 1, y: 1)
            )
            .padding(1)
            .overlay(
                RoundedRectangle(cornerRadius: 7.5)
                    .strokeBorder(style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap.butt, dash: [5], dashPhase: 2))
                    .foregroundColor(Color.black.opacity(0.8))
            )
    }
}

struct GasView: View {
    @Binding var isPossessed: Bool
    @Binding var showGas: Bool
    
    var body: some View {
        if showGas {
            if isPossessed {
                SpriteView(scene: PossessGas(), options: [.allowsTransparency])
            } else {
                SpriteView(scene: BlessGas(), options: [.allowsTransparency])
            }
        }
    }
}

struct ControlPanel: View {
    @Binding var play: Bool
    @Binding var isPossessed: Bool
    @Binding var showGas: Bool
    
    @State var isLoading = false
    @State var progress = 0
    
    let generator = UINotificationFeedbackGenerator()
    
    var body: some View {
        VStack(spacing: 30) {
            // Bulbs
            HStack {
                ForEach(1...5, id: \.self) { i in
                    Bulb(isOn: progress >= i * 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(.horizontal, 20)
            
            
            // Buttons
            HStack(spacing: 20) {
                Button {
                    bless()
                } label: {
                    PanelButton(isActive: (play && !isLoading), text: "Bless", mainColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), borderColor: Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)))
                    
                }
                
                Button {
                    possess()
                } label: {
                    PanelButton(isActive: (!play && !isLoading), text: "Possess", mainColor: Color.custom(.PsssdOrange), borderColor: Color(#colorLiteral(red: 0.7002227475, green: 0.2855848451, blue: 0.008770696605, alpha: 1)))
                }
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 40)
        .padding(.bottom, 15)
        .rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
        .background(
            RoundedRectangle(cornerRadius: 7.5)
                .fill(Color.custom(.PssssdTextColor)).rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color.black.opacity(0.3), radius: 0, x: 0, y: 4)
        )
        .padding(.bottom, 10)
        .background(
            Rectangle()
                .fill(Color.custom(.PssssdInstrumentColor))
                .rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
                .ignoresSafeArea(.all)
        )
    }
    
    // MARK: - Button Actions
    
    func bless() {
        if isLoading {
            print("Still Loading ...")
        } else if !play {
            self.generator.notificationOccurred(.error)
        } else {
            isLoading = true
            self.generator.notificationOccurred(.success)
            isPossessed = false
            showGas = true
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if self.progress != 0 {
                    self.progress -= 20
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    if self.progress == 20 {
                        play = false
                    }
                    if self.progress == 0 {
                        isLoading = false
                    }
                } else {
                    timer.invalidate()
                }
            }
            
        }
    }
    
    func possess() {
        if isLoading {
            print("Still Loading ...")
        } else if play {
            self.generator.notificationOccurred(.error)
        } else if !isLoading {
            isLoading = true
            self.generator.notificationOccurred(.success)
            isPossessed = true
            showGas = true
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if self.progress != 100 {
                    self.progress += 20
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    if self.progress == 100 {
                        play = true
                        isLoading = false
                    }
                } else {
                    timer.invalidate()
                }
            }
        }
    }
    
    
}
