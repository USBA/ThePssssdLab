//
//  WaitingRoomVM.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-04-16.
//

import SwiftUI

class WaitingRoomVM: ObservableObject {
    @Published var testSubjects: [TestSubject] = [
        TestSubject(videoName: "TestSubject1"),
        TestSubject(videoName: "TestSubject2"),
        TestSubject(videoName: "TestSubject3"),
        TestSubject(videoName: "TestSubject4"),
        TestSubject(videoName: "TestSubject5"),
        TestSubject(videoName: "TestSubject6"),
        TestSubject(videoName: "TestSubject7"),
        TestSubject(videoName: "TestSubject8"),
        TestSubject(videoName: "TestSubject9"),
        TestSubject(
            videoName: "TestSubject10",
            creditText: "@alienfrens",
            creditURL: URL(string: "https://twitter.com/alienfrens/status/1514061835292459009?s=21&t=lFrSXY0WupLP54EUKY2X1g")!
        ),
    ]
}
