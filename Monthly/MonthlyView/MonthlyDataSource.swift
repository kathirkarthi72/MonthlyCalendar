//
//  MonthlyDataSource.swift
//  Monthly
//
//  Created by Premkumar  on 19/10/19.
//  Copyright © 2019 Kathiresan. All rights reserved.
//

import UIKit

class MonthlyDataSource: NSObject {
    
    init(source: [String] = []) {
        self.source = source
    }
    
    var source: [String] = []

}

extension MonthlyDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthlyCell", for: indexPath) as! MonthlyCell

        cell.textLabel.text = source[indexPath.row]
        return cell
    }
    
    
}
