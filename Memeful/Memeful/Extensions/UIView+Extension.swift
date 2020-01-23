//
//  UIView+Extension.swift
//  Memeful
//
//  Created by Sunmoon on 22/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit
let progressView:UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    func showProgress() {
        progressView.center = self.center
        progressView.tintColor = UIColor.white
        DispatchQueue.main.async {
            self.addSubview(progressView)
            progressView.startAnimating()
        }
    }
    func hideProgress(){
        DispatchQueue.main.async {
            progressView.startAnimating()
            progressView.removeFromSuperview()
        }
    }
}
