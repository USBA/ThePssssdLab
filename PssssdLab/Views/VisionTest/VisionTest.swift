//
//  VisionTest.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import SwiftUI

struct VisionTest: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
            // MARK: Background color
            Color.custom(.PssssdBackgroundColor)
                .ignoresSafeArea(.all)
            
            // MARK: Body
            VStack(spacing: 0) {
                
                navBar
                
                Spacer()
                
                Text("Coming Soon")
                    .font(Font.system(size: 20, design: .monospaced))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    var navBar: some View {
        ZStack {
            HStack {
                // back button
                Button {
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    NavBarIcon(systemName: "arrow.backward.circle")
                }
                
                Spacer()
            }
            
            // Title
            TitleBoard(title: "Vision Test")
        }
    }

}

struct VisionTest_Previews: PreviewProvider {
    static var previews: some View {
        VisionTest()
    }
}
