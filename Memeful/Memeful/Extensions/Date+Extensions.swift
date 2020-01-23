//
//  Date+Extensions.swift
//  Memeful
//
//  Created by Sunmoon on 23/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import Foundation

extension Date {
        
    func getTimeAgoString() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return "\(year)y"
        } else if let month = interval.month, month > 0 {
            return "\(month)m"
        } else if let day = interval.day, day > 0 {
            return "\(day)d"
        }else if let hour = interval.hour, hour > 0 {
            return "\(hour)h"
        }else if let min = interval.minute, min > 0 {
            return "\(min)min"
        }else if let sec = interval.second, sec > 0 {
            return "\(sec)s"
        }
        return ""
    }

}
