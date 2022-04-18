//
//  NavBarIcon.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

struct NavBarIcon: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .frame(width: 40, height: 40)
            .font(Font.title.weight(.semibold))
            .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
            .shadow(color: Color.black.opacity(0.3), radius: 0, x: 2, y: 2)
    }
}

struct NavBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        NavBarIcon(systemName: "arrow.backward.circle")
    }
}
