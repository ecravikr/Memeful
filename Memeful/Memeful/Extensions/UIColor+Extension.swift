//
//  UIColor+Extension.swift
//  Memeful
//
//  Created by Sunmoon on 23/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit

extension UIColor{
   class func getColor(red :Float, green:Float, blue:Float, alpha:Float = 1.0) -> UIColor{
        return UIColor(displayP3Red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: CGFloat(alpha))
    }
}
