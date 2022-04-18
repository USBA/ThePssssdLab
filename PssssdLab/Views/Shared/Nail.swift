//
//  Nail.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

struct Nail: View {
    var rotationDegree: Double = 0
    var body: some View {
        Circle()
            .fill(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            .frame(width: 15, height: 15)
            .shadow(color: Color.black.opacity(0.5), radius: 0, x: 2, y: 2)
            .overlay(
                Rectangle()
                    .fill(Color.custom(.PssssdBackgroundColor))
                    .frame(width: 10, height: 2)
                    .rotationEffect(Angle(degrees: rotationDegree))
            )
    }
}

struct Nail_Previews: PreviewProvider {
    static var previews: some View {
        Nail()
    }
}
