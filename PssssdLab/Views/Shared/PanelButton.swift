//
//  PanelButton.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-19.
//

import SwiftUI

struct PanelButton: View {
    var isActive: Bool
    var text: String
    var mainColor: Color
    var borderColor: Color
    
    var body: some View {
        Text(text)
            .font(Font.system(size: 20, design: .monospaced))
            .fontWeight(.semibold)
            .foregroundColor(Color.custom(.PssssdBackgroundColor))
            .padding(.horizontal, 25)
            .padding(.vertical, 12.5)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(isActive ? mainColor : Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)))
                    .shadow(color: isActive ? borderColor : Color.black.opacity(0.6), radius: 0, x: 0, y: isActive ? 7 : 2)
            )
            .offset(y: isActive ? 0 : 5)
    }
}

struct PanelButton_Previews: PreviewProvider {
    static var previews: some View {
        PanelButton(isActive: true, text: "Button", mainColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), borderColor: Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)))
    }
}
