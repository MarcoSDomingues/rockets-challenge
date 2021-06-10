//
//  Date+Format.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import Foundation

extension Date {
    
    var short: String { return DateFormatter.shortDateFormatter.string(from: self) }

}

extension DateFormatter {
    
    static var shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
}
