//
//  TitleBoard.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

struct TitleBoard: View {
    var title: String
    
    var body: some View {
        HStack(spacing: 0) {
            Circle()
                .frame(width: 5, height: 5)
            Text(title)
//                .font(Font.custom(.BureauGrotRegular, 25))
                .font(Font.system(size: 25))
                .fontWeight(.semibold)
                .foregroundColor(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)))
                .padding(.horizontal, 12.5)
            Circle()
                .frame(width: 5, height: 5)
        }
        .padding(.vertical, 7.5)
        .padding(.horizontal, 7.5)
        .foregroundColor(Color.custom(.PssssdBackgroundColor))
        .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)), Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1))], startPoint: .bottomTrailing, endPoint: .topLeading))
        .cornerRadius(0)
        .shadow(color: Color.black.opacity(0.5), radius: 0, x: 4, y: 4)
    }
}

struct TitleBoard_Previews: PreviewProvider {
    static var previews: some View {
        TitleBoard(title: "Title")
    }
}
