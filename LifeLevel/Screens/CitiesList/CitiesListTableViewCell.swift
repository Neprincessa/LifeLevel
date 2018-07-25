//
//  CitiesListTableViewCell.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 22.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class CitiesListTableViewCell: UITableViewCell {
    
    //MARK: - Constants
    static let identifier: String = "CitiesListTableViewCell"
    static let estimateHeight: CGFloat = 71
    
    override func awakeFromNib() {
        super.awakeFromNib()
         configureLabels()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Internal Methods
    
    func configure(with city: City) {
        titleLabel.text = city.nameOfCity
    }
    
}

private extension CitiesListTableViewCell {
    
    func configureLabels() {
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLabel.textColor = UIColor(red: 32 / 255, green: 32 / 255, blue: 32 / 255, alpha: 1)
    }
}

