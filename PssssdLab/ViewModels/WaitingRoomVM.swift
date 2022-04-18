//
//  WaitingRoomVM.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

class WaitingRoomVM: ObservableObject {
    @Published private(set) var testSubjects: [TestSubject] = [
        TestSubject(videoName: "TestSubject1"),
        TestSubject(videoName: "TestSubject2"),
        TestSubject(videoName: "TestSubject3"),
        TestSubject(videoName: "TestSubject4"),
        TestSubject(videoName: "TestSubject5"),
        TestSubject(videoName: "TestSubject6"),
        TestSubject(videoName: "TestSubject7"),
        TestSubject(videoName: "TestSubject8"),
        TestSubject(videoName: "TestSubject9"),
    ]
}
