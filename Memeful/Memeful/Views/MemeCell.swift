//
//  MemeCell.swift
//  Memeful
//
//  Created by Sunmoon on 22/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit

class MemeCell: UICollectionViewCell {
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var likeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.layer.cornerRadius = 5
    containerView.layer.masksToBounds = true
  }
    func setupMemeCell(withMeme meme:Meme){
        
        self.titleLabel.text = meme.title?.capitalized
        if let points = meme.points{
            self.likeLabel.text = "↑ \(points) Points"
        }
        if let link = meme.images?.first?.link{
            self.imageView.load(url: URL(string: link)!)
            //self.imageView.loadFromAssets()
        }
        
    }
}
