//
//  extensions.swift
//  Tips
//
//  Created by Timotius Sitorus on 12/18/15.
//  Copyright © 2015 Timotius Sitorus. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(backgroundColor!), forState: .Normal, barMetrics: .Default)
        setBackgroundImage(imageWithColor(tintColor!), forState: .Selected, barMetrics: .Default)
        setDividerImage(imageWithColor(UIColor.clearColor()), forLeftSegmentState: .Normal, rightSegmentState: .Normal, barMetrics: .Default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image
    }
}
