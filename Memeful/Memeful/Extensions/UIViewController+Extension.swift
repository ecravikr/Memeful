//
//  UIViewController+Extension.swift
//  Memeful
//
//  Created by Sunmoon on 24/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit

extension UIViewController {
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
