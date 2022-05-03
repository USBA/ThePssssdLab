//
//  CapsuleButton.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-04.
//

import SwiftUI

struct CapsuleButton: View {
    var isActive: Bool = true
    var text: String
    var mainColor: Color
    
    var body: some View {
        Text(text)
            .font(Font.system(size: 20, design: .default))
            .fontWeight(.semibold)
            .foregroundColor(Color.custom(.PssssdBackgroundColor))
            .padding(.horizontal, 75)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .fill(isActive ? mainColor : Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)))
                    .shadow(color: Color.black.opacity(0.5), radius: 0, x: 2, y: 4)
            )
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(isActive: true, text: "Button", mainColor: Color.custom(.PsssdPink))
    }
}
