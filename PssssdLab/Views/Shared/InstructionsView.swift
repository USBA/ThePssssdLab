//
//  InstructionsView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-04.
//

import SwiftUI

struct InstructionsView: View {
    var instructions: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("INSTRUCTIONS")
                .underline()
                .font(Font.system(size: 25))
                .fontWeight(.semibold)
                .foregroundColor(Color.custom(.PssssdBackgroundColor))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(15)
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
                .foregroundColor(Color.custom(.PssssdBackgroundColor))
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(instructions, id: \.self) { instruction in
                    Text(instruction)
                        .font(Font.system(size: 15, design: .monospaced))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.custom(.PssssdBackgroundColor))
                }
            }
            .padding(20)
            .padding(.bottom, 20)
            
            HStack {
                Spacer()
                
                Image(systemName: "signature")
                    .font(Font.system(size: 35, weight: .thin))
            }
            .padding(20)
        }
        //.padding(15)
        .foregroundColor(Color.custom(.PssssdBackgroundColor))
        .background(Color.custom(.PssssdCardColor))
        .frame(maxWidth: 500)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.5), radius: 0, x: 4, y: 4)
        .padding(40)
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(instructions: [
            "Select the matching pairs of cards.",
            "Two points for every match.",
            "One point will get deducted per already seen cards for every mismatch."
        ])
    }
}
