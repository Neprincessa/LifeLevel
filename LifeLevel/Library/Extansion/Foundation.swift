//
//  Foundation.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 22.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import Foundation

extension NSObject {
    
    @objc class var nameOfClass: String {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return name
        }
        return ""
    }
    
    @objc var nameOfClass: String {
        if let name = NSStringFromClass(type(of: self)).components(separatedBy: ".").last {
            return name
        }
        return ""
    }
    
}
