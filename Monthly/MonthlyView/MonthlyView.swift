//
//  MonthlyView.swift
//  Monthly
//
//  Created by Premkumar  on 18/10/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

class MonthlyView: UICollectionView {
    
    var monthlyDataSouce: MonthlyDataSource = MonthlyDataSource()
    
    var days: [String] {
        return Calendar.current.weekdaySymbols
    }
    
    var showingMonth: Int! {
        didSet {
            loadMonthDays()
        }
    }
    
    var showingYear: Int! {
        didSet {
            loadMonthDays()
        }
    }
    
    var isPrevious: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    var showFirstDayAt: Int {
        let dateComponenet = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current, year: showingYear, month: showingMonth, day: 1)
        let date = Calendar.current.date(from: dateComponenet)
        
        let index = days.firstIndex(of: date!.dayOnly)
        
        return index!
    }
    
    var currentMonthDays: Int? {
        let dateComponent = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current, year: showingYear, month: showingMonth)
        
        let date = Calendar.current.date(from: dateComponent)!
        
        let range = Calendar.current.range(of: .day, in: .month, for: date)
        let numDays = range?.count
        return numDays
    }
    
    
    fileprivate func loadMonthDays() {
        
        monthlyDataSouce.source.removeAll(keepingCapacity: false)
        
        for i in 1...currentMonthDays! {
            monthlyDataSouce.source.append("\(i)")
        }
        
        for _ in 0..<showFirstDayAt {
            monthlyDataSouce.source.insert("", at: 0)
        }
        
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func setup() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updated(_:)), name: NSNotification.Name(rawValue: "YearViewUpdated"), object: nil)
        register(UINib(nibName: "MonthlyCell", bundle: nil), forCellWithReuseIdentifier: "monthlyCell")
        dataSource = monthlyDataSouce
        delegate = self
    }
    
    @objc func updated(_ notification: Notification) {
        if notification.name == NSNotification.Name(rawValue: "YearViewUpdated") {
            let updatedDetail = notification.object as! YearViewUpdated
            
            showingMonth = updatedDetail.month
            showingYear = updatedDetail.year
            self.isPrevious = updatedDetail.isPrevious
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

extension MonthlyView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: 45)
    }
    
}
