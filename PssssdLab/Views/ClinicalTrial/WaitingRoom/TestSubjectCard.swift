//
//  TestSubjectCard.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-02.
//

import SwiftUI
import AVFoundation
import VideoPlayer

struct TestSubjectCard: View {
    var testSubject: TestSubject
    
    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: getThumbnail() ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.size.width - 130, height: UIScreen.main.bounds.size.width - 130, alignment: .center)
            
                NavigationLink(destination: ClinicalTrialView(testSubject: testSubject)) {
                    CapsuleButton(text: "Select", mainColor: Color.custom(.PsssdPink))
                }
        }
            .padding()
            .padding(.bottom, 10)
            .background(Color.custom(.PssssdCardColor))
            .clipShape(RoundedRectangle(cornerRadius: 7.5))
            .shadow(color: Color.black.opacity(0.2), radius: 0, x: 2, y: 2)
        
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

struct TestSubjectCard_Previews: PreviewProvider {
    static var previews: some View {
        TestSubjectCard(testSubject: TestSubject(videoName: "TestSubject2"))
    }
}
