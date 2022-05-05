//
//  CreditTag.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-05.
//

import SwiftUI

struct CreditTag: View {
    var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(text)
                .font(Font.system(size: 15, design: .monospaced))
                .fontWeight(.semibold)
                .foregroundColor(Color.custom(.PssssdBackgroundColor))
                .padding(.vertical, 10)
                .padding(.leading, 45)
                .padding(.trailing, 15)
                .background(
                    Color.custom(.PssssdInstrumentColor)
                    .shadow(color: Color.black.opacity(0.2), radius: 0, x: 2, y: 2)
                )
            
            Image(systemName: "paperclip")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .foregroundColor(Color(UIColor.systemGray2))
                .shadow(color: Color.black.opacity(0.4), radius: 0, x: 1, y: 1)
                .offset(x: -10, y: -25)
        }
        
    }
}

struct CreditTag_Previews: PreviewProvider {
    static var previews: some View {
        CreditTag(text: "@alienfrens")
            .preferredColorScheme(.dark)
    }
}
