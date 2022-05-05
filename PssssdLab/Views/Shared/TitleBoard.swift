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
                .font(Font.system(size: 25))
                .fontWeight(.semibold)
                .foregroundColor(Color.custom(.PssssdTextColor))
                .shadow(color: Color.custom(.PssssdTextColor), radius: 2, x: 0, y: 0)
                .padding(.horizontal, 12.5)
            Circle()
                .frame(width: 5, height: 5)
        }
        .padding(.vertical, 7.5)
        .padding(.horizontal, 7.5)
        .foregroundColor(Color.custom(.PssssdBackgroundColor))
        .background(Color(UIColor.systemGray2))
        .cornerRadius(0)
        .shadow(color: Color.black.opacity(0.5), radius: 0, x: 4, y: 4)
    }
}

struct TitleBoard_Previews: PreviewProvider {
    static var previews: some View {
        TitleBoard(title: "THE PSSSSD LAB")
            .preferredColorScheme(.dark)
    }
}
