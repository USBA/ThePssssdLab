//
//  WaitingRoomView2.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-02.
//

import SwiftUI

struct WaitingRoomView2: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var roomVM = WaitingRoomVM()
    @State var showAbout = false
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: Background color
                Color.custom(.PssssdBackgroundColor)
                    .ignoresSafeArea(.all)
                
                // MARK: Body
                VStack(spacing: 0) {
                    
                    navBar
                    
                    Spacer()
                    
                    Text("Select a test subject")
                        .font(Font.system(size: 20, design: .monospaced))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.custom(.PssssdTextColor))
                    
                    // Test Subjects List
                    TestSubjectsList(roomVM: roomVM)
                    
                    Spacer()
                }
                .padding(.bottom, 25)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tint(Color.custom(.PssssdTextColor))
        }
        .sheet(isPresented: $showAbout) {
            AboutView()
        }
    }
    
    var navBar: some View {
        ZStack {
            HStack {
                // back button
                Button {
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
//                    presentationMode.wrappedValue.dismiss()
                } label: {
                    NavBarIcon(systemName: "arrow.backward.circle")
                }
                
                Spacer()
                
                // about button
                Button {
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                    showAbout = true
                } label: {
                    NavBarIcon(systemName: "info.circle")
                }
            }
            
            // Title
            TitleBoard(title: "Waiting Room")
        }
        .padding(15)
    }
}

struct WaitingRoomView2_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoomView2()
    }
}

struct TestSubjectsList: View {
    @ObservedObject var roomVM : WaitingRoomVM
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(roomVM.testSubjects, id: \.self) { testSubject in
                    NavigationLink(destination: ClinicalTrialView(testSubject: testSubject)) {
                        GeometryReader { geometry in
                            TestSubjectCard(testSubject: testSubject)
                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40) / -20), axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 100, height: UIScreen.main.bounds.size.width - 70, alignment: .center)
                    }
                }
            }
            .padding(.leading, 40)
            .padding(.trailing, 60)
            .padding(.vertical, 50)
        }
    }

}
