//
//  AboutView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let pssssdWebsite = "https://pssssd.xyz/"
    let pssssdInstagram = "https://www.instagram.com/ThePossessedNFT/"
    let normalTwitterURL = "https://twitter.com/usbakon"
    let degenTwitterURL = "https://twitter.com/metaUSB"
    let sourcecodeURL = "https://github.com/USBA/ThePssssdLab"
    
    var body: some View {
        ZStack {
            
            // MARK: Background color
            Color.custom(.PssssdBackgroundColor)
                .ignoresSafeArea(.all)
            
            // MARK: Body
            VStack(spacing: 0) {
                
                navBar
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        DescriptionCard(
                            title: "IMPORTANT",
                            descriptions: [
                                "This app is inspired by an NFT project called The Possessed.",
                                "This is NOT an official app from The Possessed team.",
                                "This is just an app created by a fan. So this is like a fan art, but an app."
                            ])
                            .rotationEffect(.degrees(-3))
                            .zIndex(10)
                        
                        DescriptionCard(
                            title: "PRIVACY",
                            descriptions: [
                                "This app DOES NOT COLLECT any of your personal data.",
                                "This app saves all of this game's data within your device.",
                                "This app does not communicate with any server.",
                                "None of your data goes out from your device."
                            ])
                            .rotationEffect(.degrees(3))
                            .zIndex(9)
                        
                        DescriptionCard(
                            title: "THIS APP",
                            descriptions: [
                                "This is a native SwiftUI iOS app.",
                                "Everything you see in this app (except the test-subject images/videos) is created completely programmatically.",
                                "Entire source code of this app is public and you can view and inspect it by visiting the link below."
                            ], links: [
                                "Source code: GitHub": sourcecodeURL
                            ])
                            .rotationEffect(.degrees(-2))
                            .zIndex(8)
                        
                        DescriptionCard(
                            title: "DEVELOPER",
                            descriptions: [
                                "Hi,\nMy name is Umayanga Alahakoon (I know, it's a wired name).", "I'm a 23 years old iOS developer from Sri Lanka."
                            ], links: [
                                "Normal Twitter: @usbakon": normalTwitterURL,
                                "Degen Twitter: @metaUSB": degenTwitterURL,
                            ])
                            .rotationEffect(.degrees(2))
                            .zIndex(7)
                        
                    }
                    .padding(30)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.custom(.PssssdTextColor))
                    .accentColor(Color.custom(.PssssdTextColor))
                }
            }
        }
    }
    
    var navBar: some View {
        ZStack {
            HStack {
                Spacer()
                Button {
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    NavBarIcon(systemName: "xmark.circle")
                }
            }
            
            // Title
            TitleBoard(title: "About")
        }
        .padding(15)
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
