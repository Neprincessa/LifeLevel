//
//  UITableView.swift
//  LifeLevel
//
//  Created by Александр Чаусов on 22.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerNib(cellType: UITableViewCell.Type) {
        register(UINib(nibName: cellType.nameOfClass, bundle: nil), forCellReuseIdentifier: cellType.nameOfClass)
    }
    
}
