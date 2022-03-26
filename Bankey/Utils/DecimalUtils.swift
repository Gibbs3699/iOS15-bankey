//
//  DecimalUtils.swift
//  Bankey
//
//  Created by TheGIZzz on 26/3/2565 BE.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
