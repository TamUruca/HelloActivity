//
//  Date+Extensions.swift
//  HelloActivity
//
//  Created by vuminhtam on 9/22/22.
//

import Foundation

enum TypeInDate {
    case day(Date)
    case month(Date)
    case year(Date)
    
    var valueDate: Int {
        switch self {
        case .day(let date):
            return date.get(.day)
        case .month(let date):
            return date.get(.month)
        case .year(let date):
            return date.get(.year)
        }
    }
}

extension Date {
    
    func toString(format: DateFormat = .input1) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.format
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
           return calendar.dateComponents(Set(components), from: self)
       }

       func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
           return calendar.component(component, from: self)
       }
}
