//
//  WaitingRoomViewOLD.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI
import AVFoundation
import VideoPlayer

struct WaitingRoomViewOLD: View {
    @StateObject var roomVM = WaitingRoomVM()
    @State var showAbout = false
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: Background color
                Color.custom(.PssssdBackgroundColor)
                    .ignoresSafeArea(.all)
                
                // MARK: Body
                VStack(spacing: 0) {
                    
                    navBar
                    
                    // Test Subjects List
                    ScrollView {
                        Text("Select a test subject")
                            .font(Font.system(size: 20, design: .monospaced))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.custom(.PssssdTextColor))
                            .padding(.top, 10)
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(roomVM.testSubjects) { testSubject in
                                TestSubjectThumbnail(testSubject: testSubject)
                            }
                        }
                        .padding()
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tint(Color.custom(.PssssdTextColor))
        }
        .sheet(isPresented: $showAbout) {
            AboutView()
        }
    }
    
    var navBar: some View {
        ZStack {
            HStack {
                Spacer()
                Button {
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                    showAbout = true
                } label: {
                    NavBarIcon(systemName: "info.circle")
                }
            }
            
            // Title
            TitleBoard(title: "Waiting Room")
        }
        .padding(15)
    }
}

struct WaitingRoomViewOLD_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoomViewOLD()
    }
}

struct TestSubjectThumbnail: View {
    var testSubject: TestSubject
    
    var body: some View {
        NavigationLink(destination: ClinicalTrialView(testSubject: testSubject)) {
            thumbnail
                .background(Color.gray)
                .cornerRadius(7.5)
        }
    }
    
    
    var thumbnail: some View {
        Image(uiImage: getThumbnail() ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    func getThumbnail() -> UIImage? {
        let asset = AVAsset(url: Bundle.main.url(forResource: testSubject.videoName, withExtension: "mp4")!)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        //Can set this to improve performance if target size is known before hand
        //assetImgGenerate.maximumSize = CGSize(width,height)
        let time = CMTime(seconds: 0.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        } catch {
          print(error.localizedDescription)
          return nil
        }
    }
}
