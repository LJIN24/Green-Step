//
//  Date.swift
//  GreenStep
//
//  Created by JIN on 7/30/25.
//

import Foundation

extension Date {
    
    init(lastUpdated: String){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        let date = formatter.date(from: lastUpdated) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyy-MMM-dd"
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortDateFormatter.string(from: self)
    }
}
