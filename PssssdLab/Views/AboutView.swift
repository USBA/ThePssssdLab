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
    let twitterURL = URL(string: "https://twitter.com/metaUSB")!
    let sourcecodeURL = URL(string: "https://github.com/USBA/ThePssssdLab")!
    
    var body: some View {
        ZStack {
            
            // MARK: Background color
            Color.custom(.PssssdBackgroundColor)
                .ignoresSafeArea(.all)
            
            // MARK: Body
            VStack(spacing: 0) {
                
                navBar
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Hi,\nI'm an iOS developer from Sri Lanka and I've created this app just for fun.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        Text("This app is inspired by an upcoming NFT project called [The Possessed](https://pssssd.xyz/). This is just an app created by a fan. So this is like a fan art, but an app.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        Text("I'm NOT a part of [The Possessed](https://pssssd.xyz/) team and this is NOT an official app from the team.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        Text("All the images and videos of test subjects are created by the official team. I just stole them from [Instagram](https://www.instagram.com/ThePossessedNFT/).")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        Text("Have fun. TC.")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                        
                        
                        Rectangle()
                            .frame(height: 1)
                            .padding(.vertical, 10)
                        
                        // developer's twitter link
                        Link(destination: twitterURL) {
                            HStack {
                                Text("Twitter:")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                Text("@metaUSB")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .underline()
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        
                        // app's source code
                        Link(destination: sourcecodeURL) {
                            HStack {
                                Text("Source code:")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                Text("GitHub")
                                    .font(Font.system(size: 20, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .underline()
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        
                    }
                    .padding()
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
