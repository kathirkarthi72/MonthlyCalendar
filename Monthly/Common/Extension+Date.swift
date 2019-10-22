//
//  Extension+Date.swift
//  Monthly
//
//  Created by Premkumar  on 19/10/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import Foundation

extension Date {
    
    // MARK: DateFormatter
    /// Get Day only
    var dayOnly: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "EEEE"
        let time = formatter.string(from: self)
        
        return time
    }
}
