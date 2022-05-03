//
//  Array+Only.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-03.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
