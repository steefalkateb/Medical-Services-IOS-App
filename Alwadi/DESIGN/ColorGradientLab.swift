//
//  ColorGradientLab.swift
//  Alwadi
//
//  Created by MacBookPro on 11/19/21.
//

import Foundation
import UIKit
class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        
//        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
//        gradientLayer.locations = [0, 0.1, 0.9, 1]
        
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.6)
        let whiteColor = UIColor.white
        gradientLayer.colors = [whiteColor.withAlphaComponent(0.0).cgColor, whiteColor.withAlphaComponent(0.8).cgColor, whiteColor.withAlphaComponent(0.5).cgColor]
        gradientLayer.locations = [NSNumber(value: 0.0),NSNumber(value: 0.2),NSNumber(value: 0.6)]
     
        
//        gradientLayer.locations = [NSNumber(value: 0.0),NSNumber(value: 0.2),NSNumber(value: 1.0)]
 
    }
}
