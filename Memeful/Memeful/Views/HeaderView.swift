//
//  HeaderView.swift
//  Memeful
//
//  Created by Sunmoon on 22/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memeButton: UIButton!
    @IBOutlet weak var collageButton: UIButton!
    @IBOutlet weak var totalViewLabel: UILabel!
    
    func setUpHeaderView(meme:Meme){
        self.memeButton.backgroundColor = UIColor.red
        self.collageButton.backgroundColor = UIColor.blue
        if let totalViewsCount = meme.views{
            self.totalViewLabel.text = "\(totalViewsCount) views"
        }
        if let link = meme.images?.first?.link{
            self.imageView.load(url: URL(string: link)!)
            //self.imageView.loadFromAssets()
        }
        
    }
}
