//
//  HomeView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI

struct HomeView: View {
    @State var showAbout = false

    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: Background color
                Color.custom(.PssssdBackgroundColor)
                    .ignoresSafeArea(.all)
                
                Image("PSSSSD-Logo")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.black.opacity(0.1))
                    .offset(x: 150, y: 200)
                
                Image("PSSSSD-Logo")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.8)
                    .foregroundColor(Color.black.opacity(0.1))
                    .offset(x: -230, y: 380)
                
                Image("PSSSSD-Logo")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.black.opacity(0.1))
                    .offset(x: -150, y: -200)
                
                Image("PSSSSD-Logo")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.8)
                    .foregroundColor(Color.black.opacity(0.1))
                    .offset(x: 230, y: -380)
                
                // MARK: Body
                VStack(spacing: 50) {
                    TitleBoard(title: "THE PSSSSD LAB")
                    
                    Spacer()
                    
                    NavigationLink(destination: WaitingRoomView()) {
                        HomeButton(text: "Clinical Trail", mainColor: Color.custom(.PsssdPink), borderColor: Color.black.opacity(0.5), imageName: "Head", imageWidth: 65, imageOffsetY: -30)
                    }
                    
                    NavigationLink(destination: BrainTestView()) {
                        HomeButton(text: "Brain Test", mainColor: Color.custom(.PsssdGreen), borderColor: Color.black.opacity(0.5), imageName: "Brain", imageWidth: 75, imageOffsetY: -20)
                    }
                    
                    NavigationLink(destination: VisionTest()) {
                        HomeButton(text: "Vision Test", mainColor: Color.custom(.PssssdInstrumentColor), borderColor: Color.black.opacity(0.5), imageName: "Eyes", imageWidth: 75, imageOffsetY: -20)
                    }
                    
                    Spacer()
                    
                    // About button
                    Button {
                        let impactMed = UIImpactFeedbackGenerator(style: .light)
                        impactMed.impactOccurred()
                        showAbout = true
                    } label: {
                        NavBarIcon(systemName: "info.circle")
                    }
                    
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 20)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .sheet(isPresented: $showAbout) {
            AboutView()
        }
    }
    
    var navBar: some View {
        ZStack {
//            HStack {
//                Spacer()
//                Button {
//                    let impactMed = UIImpactFeedbackGenerator(style: .light)
//                    impactMed.impactOccurred()
//                    showAbout = true
//                } label: {
//                    NavBarIcon(systemName: "info.circle")
//                }
//            }
            
            // Title
            TitleBoard(title: "THE PSSSSD LAB")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
