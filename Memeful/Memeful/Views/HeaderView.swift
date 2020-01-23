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
        
        let color = UIColor.getColor(red: 51, green: 53, blue: 58)
        self.backgroundColor = color
        self.imageView.backgroundColor = color
        if let totalViewsCount = meme.views{
            self.totalViewLabel.text = "\(totalViewsCount) views"
        }
        if let link = meme.images?.first?.link{
            self.imageView.load(url: URL(string: link)!)
//            self.imageView.loadFromAssets()
        }
        memeButton.backgroundColor = UIColor.red
        memeButton.setTitle("⨁   memes", for: .normal)
        memeButton.layer.cornerRadius = 15
        
        collageButton.backgroundColor = UIColor.green
        collageButton.setTitle("⨁   college", for: .normal)
        collageButton.layer.cornerRadius = 15
        
    }
}
