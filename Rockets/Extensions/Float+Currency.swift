//
//  Float+Currency.swift
//  Rockets
//
//  Created by Marco Domingues on 11/06/2021.
//

import Foundation

extension Float {
    
    var currency: String? { return NumberFormatter.currency.string(from: NSNumber(value: self)) }
    
}

private extension NumberFormatter {

    static var currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter
    }()
    
}
