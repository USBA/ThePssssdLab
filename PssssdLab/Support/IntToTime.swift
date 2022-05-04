//
//  IntToTime.swift
//  PssssdLab
//
//  Created by Umayanga Alahakoon on 2022-05-05.
//

import Foundation

func convertSecondsToHrMinuteSec(seconds: Int) -> String{
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = seconds > 60 ? .abbreviated : .brief
    
    let formattedString = formatter.string(from:TimeInterval(seconds))!
    print(formattedString)
    return formattedString
}
