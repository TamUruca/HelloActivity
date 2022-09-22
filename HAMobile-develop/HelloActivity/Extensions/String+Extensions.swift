//
//  String+Extensions.swift
//  HelloActivity
//
//  Created by vuminhtam on 9/19/22.
//

import Foundation

extension String {
    
    func toDate(format: DateFormat = .input1) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.format
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.date(from: self) ?? nil
    }
}

enum DateFormat {
    case input0
    case input1
    case input2
    case input3
    case input4
    case output1
    case output2
    case output3
    case output4
    case output5
    case output6
    case outputJP
    case outputSpaceJP
    case outputJPDefault
    
    var format: String {
        switch self {
        case .input0: return "yyyy-MM-dd"
        case .input1: return "yyyy-MM-dd h:mm"
        case .input2: return "yyyy.MM.dd h:mm"
        case .input3: return "yyyy年MM月dd日 h:mm"
        case .input4: return "h:mm"
        case .output1: return "yyyy-MM-dd h:mm a"
        case .output2: return "yyyy.MM.dd　h:mm a"
        case .output3: return "yyyy年MM月dd日"
        case .output4: return "h:mm a"
        case .output5: return "yyyy年MM月dd日 (月)　h:mm a"
        case .output6: return "MM月dd日"
        case .outputJP: return "yyyy年MM月dd日　h:mm a"
        case .outputSpaceJP: return "yyyy年 MM月 dd日　h:mm a"
        case .outputJPDefault: return "yyyy年 MM月 dd日"
        }
    }
}
