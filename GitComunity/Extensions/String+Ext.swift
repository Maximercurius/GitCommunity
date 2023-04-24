//
//  String+Ext.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 24.04.2023.
//

import Foundation

extension String {
    
    func covertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    func convertToDisplayFormat() -> String {
        guard let date = self.covertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
