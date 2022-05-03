//
//  ClinicalTrialView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI
import AVFoundation
import VideoPlayer

struct ClinicalTrialView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var trialVM = ClinicalTrialVM()
    var testSubject: TestSubject

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
                    
                    LabWindow(testSubject: testSubject, play: $trialVM.play)
                        .padding()
                        .onAppear {
                            trialVM.isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                trialVM.play = false
                                trialVM.isLoading = false
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
                
                ControlPanel(trialVM: trialVM)

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
    
    var body: some View {
        VideoPlayer(url: Bundle.main.url(forResource: testSubject.videoName, withExtension: "mp4")!, play: $play)
            .autoReplay(true)
            .aspectRatio(contentMode: .fit)
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

struct ControlPanel: View {
    @ObservedObject var trialVM: ClinicalTrialVM
    
    var body: some View {
        VStack(spacing: 30) {
            // Bulbs
            HStack {
                ForEach(1...5, id: \.self) { i in
                    Bulb(isOn: trialVM.progress >= i * 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(.horizontal, 20)
            
            
            // Buttons
            HStack(spacing: 20) {
                Button {
                    trialVM.bless()
                } label: {
                    PanelButton(isActive: (trialVM.play && !trialVM.isLoading), text: "Bless", mainColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), borderColor: Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)))
                    
                }
                
                Button {
                    trialVM.possess()
                } label: {
                    PanelButton(isActive: (!trialVM.play && !trialVM.isLoading), text: "Possess", mainColor: Color.custom(.PsssdOrange), borderColor: Color(#colorLiteral(red: 0.7002227475, green: 0.2855848451, blue: 0.008770696605, alpha: 1)))
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
}
