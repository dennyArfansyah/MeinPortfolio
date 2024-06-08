//
//  NumberFormatter+Ext.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 16/05/24.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
