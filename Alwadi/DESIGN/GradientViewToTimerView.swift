//
//  GradientViewToTimerView.swift
//  Alwadi
//
//  Created by MacBookPro on 1/10/22.
//

import Foundation
import UIKit

class GradientViewToTimerView: UIView {
    

    
    
    @IBInspectable var cornerRadius : CGFloat = 0

    @IBInspectable var shadowColor : UIColor? = UIColor.black
  
    @IBInspectable let shadowOffSetWidth : Int = 0
    @IBInspectable let shadowOffSetHeight : Int = 1
    
    @IBInspectable var shadowOpacity : Float = 0.5
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        
        layer.shadowColor = shadowColor?.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = shadowOpacity
    
        
    }
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
       @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
       @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
       @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
       @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
       @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

       override public class var layerClass: AnyClass { CAGradientLayer.self }

       var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

       func updatePoints() {
           if horizontalMode {
               gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
               gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
           } else {
               gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
               gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
           }
       }
       func updateLocations() {
           gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
       }
       func updateColors() {
           gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
       }
       override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
           super.traitCollectionDidChange(previousTraitCollection)
           updatePoints()
           updateLocations()
           updateColors()
       }




}
