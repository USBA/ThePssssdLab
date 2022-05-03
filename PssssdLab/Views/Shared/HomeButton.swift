//
//  HomeButton.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI

struct HomeButton: View {
    var text: String
    var mainColor: Color
    var borderColor: Color
    
    var imageName: String
    var imageWidth: CGFloat
    var imageOffsetY: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Text(text)
                .font(Font.system(size: 25, design: .default))
                .fontWeight(.semibold)
                .foregroundColor(Color.custom(.PssssdBackgroundColor))
                .padding(.horizontal, 25)
                .padding(.vertical, 12.5)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(mainColor)
                        .shadow(color: borderColor, radius: 0, x: 0, y: 7)
                )
            
            
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth)
                    .offset(y: imageOffsetY)
                    .padding(.horizontal, 10)
        }
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton(text: "Button", mainColor: Color.custom(.PssssdInstrumentColor), borderColor: Color.black.opacity(0.5), imageName: "Eyes", imageWidth: 75, imageOffsetY: -20)
    }
}
