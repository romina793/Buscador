//
//  FormatterHelper.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import Foundation

internal class FormatterHelper {
    
    static func setFormatterNumber(currencyId: String, price: String) -> String  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        switch currencyId {
        case "USD":
            formatter.currencySymbol = "U$S "
        default:
            formatter.currencySymbol = "$ "
        }
        formatter.minimumFractionDigits = 0
        guard let double = Double(price) else {return ""}
        var result = formatter.string(from: NSNumber(value: double))
        result = result?.replacingOccurrences(of: ",", with: ".")
        return result ?? ""
    }
}
