//
//  CalendarView.swift
//  Monthly
//
//  Created by Premkumar  on 18/10/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

class CalendarView: UIView {
    
    @IBOutlet weak var monthlyCalendarView: MonthlyView!
    @IBOutlet weak var yearView: YearView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    func setup() {
        
        let view = Bundle.main.loadNibNamed("CalendarView", owner: self, options: nil)?.first as! UIView
        view.frame = bounds
        self.addSubview(view)
    }
}



