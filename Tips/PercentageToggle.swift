//
//  PercentageToggle.swift
//  Tips
//
//  Created by Timotius Sitorus on 12/18/15.
//  Copyright © 2015 Timotius Sitorus. All rights reserved.
//

import UIKit

@IBDesignable
class PercentageToggle: UIView {

    @IBOutlet var view: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSBundle.mainBundle().loadNibNamed("PercentageToggle", owner: self, options: nil)
        self.addSubview(view)
    }
}
