//
//  ColorsAndFonts.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

enum ProjectColors: String {
    case PssssdBackgroundColor = "PssssdBackgroundColor"
    case PssssdTextColor = "PssssdTextColor"
    case PssssdInstrumentColor = "PssssdInstrumentColor"
    case PssssdBlue = "PssssdBlue"
    case PsssdPink = "PsssdPink"
    case PsssdGreen = "PsssdGreen"
    case PsssdOrange = "PsssdOrange"
    
}

enum ProjectFonts: String {
    case BureauGrotRegular = "BureauGrotRegular"
    
}

extension Font {
    static func custom(_ name: ProjectFonts, _ size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}

extension Color {
    static func custom(_ name: ProjectColors) -> Color {
        return Color(name.rawValue)
    }
}
