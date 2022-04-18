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
                
                Spacer()
                
                // Bulbs
                HStack {
                    ForEach(1...5, id: \.self) { i in
                        Bulb(isOn: trialVM.progress >= i * 20)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Bottom Buttons
                HStack(spacing: 20) {
                    Button {
                        trialVM.bless()
                    } label: {
                        Text("Possess")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                            .opacity(0)
                            .overlay(
                                Text("Bless")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.custom(.PssssdBackgroundColor))
                            )
                            .padding(.horizontal, 25)
                            .padding(.vertical, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((trialVM.play && !trialVM.isLoading) ? Color.custom(.PsssdGreen) : Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)))
                                    .shadow(color: Color.black.opacity(0.6), radius: 0, x: 7, y: 7)
                            )
                        
                    }
//                    .disabled(trialVM.isLoading)
                    
                    Button {
                        trialVM.possess()
                    } label: {
                        Text("Possess")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                            .opacity(0)
                            .overlay(
                                Text("Possess")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.custom(.PssssdBackgroundColor))
                            )
                            .padding(.horizontal, 25)
                            .padding(.vertical, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((!trialVM.play && !trialVM.isLoading) ? Color.custom(.PsssdOrange) : Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)))
                                    .shadow(color: Color.black.opacity(0.6), radius: 0, x: 7, y: 7)
                            )
                    }
//                    .disabled(trialVM.isLoading)
                }

            }
            .padding()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    var navBar: some View {
        ZStack {
            HStack {
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
