//
//  PossessGas.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-10.
//

import SwiftUI
import SpriteKit

class PossessGas: SKScene, ObservableObject {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point...
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        // bg color
        backgroundColor = .clear
        
        // creating node and adding to scene...
        let node = SKEmitterNode(fileNamed: "Smoke.sks")!
        addChild(node)
        
        // full width
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}
