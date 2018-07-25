//
//  CityDetailsTableViewCell.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 25.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class CityDetailsTableViewCell: UITableViewCell {

    @IBOutlet fileprivate var data: UILabel!
    
    //MARK: - Constants
    static let identifier: String = "CityDetailsTableViewCell"
    static let estimateHeight: CGFloat = 71
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //configureDetailLabels()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Internal Methods
    
    func configure(with city: CityDetailsEntity) {
        data.text = city.name
    }
    
}

// MARK: - Configure

//private extension CityDetailsTableViewCell {
//
//    func configureDetailLabels() {
//        data.font = UIFont.systemFont(ofSize: 17, weight: .medium)
//        data.textColor = UIColor(red: 32 / 255, green: 32 / 255, blue: 32 / 255, alpha: 1)
//    }
//
//}
