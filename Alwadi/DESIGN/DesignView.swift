//
//  DesignView.swift
//  Alwadi
//
//  Created by MacBookPro on 11/17/21.
//

import Foundation
import UIKit
//https://www.youtube.com/watch?v=cubXeDj0LPI
@IBDesignable class DesignView : UIView {
    
//    @IBInspectable var cornerRadius : CGFloat = 20
    @IBInspectable var cornerRadius : CGFloat = 10

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
    @IBInspectable
       var borderWidth: CGFloat {
           get {
               return layer.borderWidth
           }
           set {
               layer.borderWidth = newValue
           }
       }
    
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    
    
}
