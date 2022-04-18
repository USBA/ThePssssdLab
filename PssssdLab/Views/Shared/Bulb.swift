//
//  Bulb.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

struct Bulb: View {
    var isOn = false
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(colors: isOn ? [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))] : [Color(#colorLiteral(red: 0.4527207295, green: 0.5874027694, blue: 0.005986968708, alpha: 1)), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))], startPoint: .bottomTrailing, endPoint: .topLeading)
            )
            .frame(width: 15, height: 15)
            .shadow(color:  isOn ? Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)) : Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), radius: 8, x: 0, y: 0)
            .shadow(color:  isOn ? Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)) : Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)), radius: 0, x: 0, y: 4)
    }
}

struct Bulb_Previews: PreviewProvider {
    static var previews: some View {
        Bulb()
    }
}
