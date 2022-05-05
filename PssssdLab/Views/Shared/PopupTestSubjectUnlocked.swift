//
//  PopupTestSubjectUnlocked.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-04.
//

import SwiftUI
import AVFoundation
import VideoPlayer

struct PopupTestSubjectUnlocked: View {
    var testSubject: TestSubject
    
    var body: some View {
        HStack {
            testSubjectImage
                .padding(.trailing, 2.5)
                
            VStack(alignment: .leading) {
                Text("Test Subject Unlocked")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text("For the clinical trial")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color(.systemGray2))
                    .padding(.leading, 1)
            }
            
        }
        .padding(10)
        .padding(.trailing, 10)
        .background(
            Capsule()
                .fill(Color.black)
                .shadow(color: Color.black.opacity(0.12), radius: 15)
        )
    }
    
    var testSubjectImage: some View {
        Image(uiImage: getThumbnail() ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50, alignment: .center)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.4), radius: 0, x: 4, y: 4)
            .overlay(
                Circle().stroke(Color.custom(.PssssdCardColor), lineWidth: 2)
            )
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

struct PopupTestSubjectUnlocked_Previews: PreviewProvider {
    static var previews: some View {
        PopupTestSubjectUnlocked(testSubject: TestSubject(videoName: "TestSubject10"))
            .preferredColorScheme(.dark)
    }
}
