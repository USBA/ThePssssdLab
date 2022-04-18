//
//  AboutView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let pssssdWebsite = URL(string: "https://pssssd.xyz/")!
    let pssssdInstagram = URL(string: "https://www.instagram.com/ThePossessedNFT/")!
    let appStoreURL = URL(string: "https://apps.apple.com/us/developer/umayanga-alahakoon/id1481069353")!
    let twitterURL = URL(string: "https://twitter.com/metaUSB")!
    let discordUsername = "USB#3210"
    
    var body: some View {
        ZStack {
            
            // MARK: Background color
            Color.custom(.PssssdBackgroundColor)
                .ignoresSafeArea(.all)
            
            // MARK: Body
            VStack(spacing: 0) {
                
                navBar
                
                // Test Subjects List
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Hi,\nI'm an iOS developer from Sri Lanka and I've created this app just for fun.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
//                        Rectangle()
//                            .frame(height: 1)
                        
                        Text("This app is inspired by an upcoming NFT project called [The Possessed](https://pssssd.xyz/). This is just an app created by a fan. So this is like a fan art, but an app.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        Text("I'm not a part of [The Possessed](https://pssssd.xyz/) team and this is not an official app from the team.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        Text("All the images and videos in this app are created by the official team. I just stole them from [Instagram](https://www.instagram.com/ThePossessedNFT/).")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        Text("Have fun. TC.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        
                        Rectangle()
                            .frame(height: 1)
                            .padding(.vertical, 10)
                        
                        HStack {
                            Text("Twitter:")
                                .font(Font.system(size: 20, design: .monospaced))
                                .fontWeight(.semibold)
                            
                            Link(destination: twitterURL) {
                                Text("@metaUSB")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .underline()
                                +
                                Text(" 🔗")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        HStack {
                            Text("Discord:")
                                .font(Font.system(size: 20, design: .monospaced))
                                .fontWeight(.semibold)
                            
                            Text(discordUsername)
                                .font(Font.system(size: 20, design: .monospaced))
                                .fontWeight(.semibold)
                                .textSelection(.enabled)
                                .onTapGesture {
                                    copyDiscordToClipboard()
                                }
                            
                            Text("📋")
                                .font(Font.system(size: 20, design: .monospaced))
                                .fontWeight(.semibold)
                                .onTapGesture {
                                    copyDiscordToClipboard()
                                }
                        }
                        
                    }
                    .padding()
                    .padding(.vertical, 10)
                    .foregroundColor(Color.custom(.PssssdTextColor))
                    .tint(Color.custom(.PssssdTextColor))
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
    
    func copyDiscordToClipboard() {
        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
        impactMed.impactOccurred()
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = discordUsername
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
