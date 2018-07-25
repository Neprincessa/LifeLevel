//
//  LLNavigationController.swift
//  LifeLevel
//
//  Created by Анастасия Худоярова on 20.07.2018.
//  Copyright © 2018 Neprincessa. All rights reserved.
//

import UIKit

class LLNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        setNavigationBarColor()
    }

}

//MARK: - Extensions

private extension LLNavigationController {
    
    func configureAppearance() {
        navigationBar.tintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar.barStyle = .black
    }
    
    func  setNavigationBarColor(){
        var colors = [UIColor]()
        colors.append(UIColor(red: 100/255, green: 24/255, blue: 13/255, alpha: 1))
        colors.append(UIColor(red: 255/255, green: 110/255, blue: 80/255, alpha: 1))

        navigationBar.setGradientBackground(colors: colors)
    }
}

extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 0, y: 0)
        endPoint = CGPoint(x: 0, y: 1)
    }
    
    func createGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}

extension UINavigationBar {
    
    func setGradientBackground(colors: [UIColor]) {
        
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        updatedFrame.size.height += UIApplication.shared.statusBarFrame.height
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
func statusBarHeight() -> CGFloat {
    let statusBarSize = UIApplication.shared.statusBarFrame.size
    return Swift.min(statusBarSize.width, statusBarSize.height)
}

