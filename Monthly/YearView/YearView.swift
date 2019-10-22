//
//  YearView.swift
//  Monthly
//
//  Created by Premkumar  on 18/10/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

struct YearViewUpdated {
    var yearView: YearView!
    var year: Int!
    var month: Int!
    var isPrevious: Bool?
}


class YearView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var today = Today()
    
    var showingMonth: Int!
    
    var showingYear: Int!
    
    var months: [String] {
        return Calendar.current.monthSymbols
    }
    
    fileprivate func updateDetails(_ isPrevious: Bool?) {
        monthLabel.text = months[showingMonth - 1]
        yearLabel.text = showingYear.description
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "YearViewUpdated"), object: YearViewUpdated(yearView: self, year: showingYear, month: showingMonth, isPrevious: isPrevious))
    }
    
    func setup() {
        
        let view = Bundle.main.loadNibNamed("YearView", owner: self, options: nil)?.first as! UIView
        view.frame = bounds
        self.addSubview(view)
        
        showingMonth = today.month
        showingYear = today.year
        
        updateDetails(nil)
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    @IBAction func previousMonthButton(_ sender: Any) {
        if showingMonth == 1 {
            showingMonth = 12
            showingYear -= 1
        } else {
            showingMonth -= 1
        }
        
        
        updateDetails(true)
    }
    
    @IBAction func nextMonthButton(_ sender: Any) {
        
        if showingMonth == 12 {
            showingMonth = 1
            showingYear += 1
            
        } else {
            showingMonth += 1
        }
        
        
        updateDetails(false)
    }
    
}


class Today: NSObject {
    
    var currentDate = Date()
    
    var date: Int {
        return Calendar.current.component(.day, from: currentDate)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: currentDate)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: currentDate)
    }
    
    var nameOfMonth: String {
        return Calendar.current.monthSymbols[month - 1]
    }
}
