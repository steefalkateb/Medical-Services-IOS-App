//
//  BorderView.swift
//  Alwadi
//
//  Created by MacBookPro on 11/29/21.
//

import UIKit
//https://www.youtube.com/watch?v=cubXeDj0LPI
@IBDesignable class BorderView : UIView {
    

    
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
