//
//  Date+Ext.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 24.04.2023.
//

import Foundation

extension Date{
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
