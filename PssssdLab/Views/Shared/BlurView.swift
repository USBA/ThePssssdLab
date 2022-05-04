//
//  BlurView.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-04.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    var effect: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView {
        let blueEffect = UIBlurEffect(style: effect)
        let blurview = UIVisualEffectView(effect: blueEffect)
        return blurview
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
        
    }
}
