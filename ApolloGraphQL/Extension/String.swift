//
//  String.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

extension String {
    func convertToDateWithFormat(format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        if self.isEmpty == false && format.isEmpty == false {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            if let date = formatter.date(from: self) {
                return date
            }
            else {
                return nil
            }
        }
        return nil
    }
    
    func convertToDateTimeAgo() -> String? {
        if let date = self.convertToDateWithFormat(), let dateStr = date.convertToDateTimeAgo() {
            return dateStr
        }
        return nil
    }
}

// MARK: - DateFomatter
extension DateFormatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
}

// MARK: - Date
extension Date {
    func convertToDateTimeAgo(_ isCheckSameYear: Bool = false) -> String? {
        let dateFormatter = DateFormatter()
        let now = Date()
        let deltaSeconds = Int(now.timeIntervalSince(self))
        let deltaMinutes = Int(deltaSeconds) / 60
        var x = 0
        if(deltaSeconds < 5) {
            return "Vừa mới đây"
        }
        else if(deltaSeconds < 60) {
            return String(format: "%d giây trước", deltaSeconds)
        }
        else if(deltaSeconds < 120) {
            return "Một phút trước"
        }
        else if (deltaMinutes < 60) {
            return String(format: "%d phút trước", deltaMinutes)
        }
        else if (deltaMinutes < 120) {
           return "Một giờ trước"
        }
        else if (deltaMinutes < (24 * 60)) {
            x = Int(floor(Double(deltaMinutes)/60))
            return String(format: "%d giờ trước", x)
        }
        else if (deltaMinutes < (24 * 60 * 2)) {
            return "Hôm qua"
        }
        else if (deltaMinutes < (24 * 60 * 7)) {
            x = (Int(floor(Double(deltaMinutes)/(60 * 24))))
            return String(format: "%d ngày trước", x)
        }
    
        dateFormatter.dateFormat = "MMMM dd yyyy"
        dateFormatter.locale = Locale(identifier: "en-US")
        if isCheckSameYear {
            if Calendar.current.isDate(self, equalTo: now, toGranularity: .year) {
                dateFormatter.dateFormat = "MMMM dd, HH:mm"
                dateFormatter.locale = Locale(identifier: "en-US")
            }
            else {
                dateFormatter.dateFormat = "MMMM dd yyyy, HH:mm"
                dateFormatter.locale = Locale(identifier: "en-US")
            }
        }
        let dateTimeAgo = dateFormatter.string(from: self)
        return dateTimeAgo
    }
    var ldiso8601: String {
        return DateFormatter.iso8601.string(from: self)
    }
}
