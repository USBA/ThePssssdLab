////
////  ClinicalTrialVM.swift
////  PssssdLab
////
////  Created by Umayanga Alahakoon on 2022-04-16.
////
//
//import SwiftUI
//
//class ClinicalTrialVM: ObservableObject {
//    @Published var play = true
//    @Published var isPossessed = false
//    @Published var isLoading = false
//    @Published var progress = 0
//    
//    let generator = UINotificationFeedbackGenerator()
//    
//    // MARK: - Button Actions
//    
//    func bless() {
//        if isLoading {
//            print("Still Loading ...")
//        } else if !play {
//            self.generator.notificationOccurred(.error)
//        } else {
//            self.isLoading = true
//            self.generator.notificationOccurred(.success)
////            self.isPossessed = false
//            
////            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
////                self.progress = 0
////                self.play = false
////                self.isLoading = false
////            }
//            
//            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//                if self.progress != 0 {
//                    self.progress -= 20
//                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
//                    impactMed.impactOccurred()
//                    if self.progress == 20 {
//                        self.play = false
//                    }
//                    if self.progress == 0 {
//                        self.isLoading = false
//                    }
//                } else {
//                    timer.invalidate()
//                }
//            }
//            
//        }
//    }
//    
//    func possess() {
//        if isLoading {
//            print("Still Loading ...")
//        } else if play {
//            self.generator.notificationOccurred(.error)
//        } else if !isLoading {
//            isLoading = true
//            self.generator.notificationOccurred(.success)
////            self.isPossessed = true
//            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//                if self.progress != 100 {
//                    self.progress += 20
//                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
//                    impactMed.impactOccurred()
//                    if self.progress == 100 {
//                        self.play = true
//                        self.isLoading = false
//                    }
//                } else {
//                    timer.invalidate()
//                }
//            }
//        }
//    }
//    
//}
