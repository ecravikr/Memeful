//
//  MemeDetailCell.swift
//  Memeful
//
//  Created by Sunmoon on 23/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit

class MemeDetailCell: UITableViewCell {
    @IBOutlet weak var commenterPic: UIImageView!
    @IBOutlet weak var commentSection: UIView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var totalReplies: UILabel!
    @IBOutlet weak var commenterTitle: UILabel!
    @IBOutlet weak var commentsSectionHStack: UIStackView!
    
    var upsButton:UIButton?
    var downsButton:UIButton?
    var replyButton:UIButton?
    var moreButton:UIButton?
    
    override func awakeFromNib() {
      super.awakeFromNib()
    }
    
    func setupComment(comment:Comment, indexPath:IndexPath){
        commenterPic.loadFromAssets(name: "first")
        if let dateTime = comment.datetime{
            let dateStr = Date(timeIntervalSince1970: TimeInterval(dateTime)).getTimeAgoString()
            //let dateStr = Date().getTimeAgoString()
            commenterTitle.text = "\(comment.author ?? "")  •  \(dateStr)"
        }else{
            commenterTitle.text = "\(comment.author ?? "")"
        }
        //let a = Date.getElapsedInterval(Date(timeIntervalSince1970: 0))
        
        commentLabel.text = comment.comment
        if comment.children!.count > 0 {
            totalReplies.text = "\(comment.children!.count) Reply"
            totalReplies.isHidden = false
        }else{
            totalReplies.isHidden = true
        }
        totalReplies.layer.cornerRadius = 10
        totalReplies.backgroundColor = replyBGColor
        getCommentSection(comment: comment)
        
    }
    
    func getCommentSection(comment:Comment)  {
        self.commentsSectionHStack.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        self.commentsSectionHStack.axis = .horizontal
        self.commentsSectionHStack.alignment = .leading
        self.commentsSectionHStack.spacing = 30
        self.commentsSectionHStack.distribution = .fill
        
        let font = UIFont.boldSystemFont(ofSize: 15)
        
        self.upsButton = UIButton()
        self.upsButton?.titleLabel?.font = font
        self.upsButton?.tintColor = upsDownsColor
        self.upsButton?.setTitle("↑ \(comment.ups ?? 0)", for: .normal)
        self.upsButton!.widthAnchor.constraint(equalToConstant: 75).isActive = true
        self.upsButton!.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.upsButton!.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        self.commentsSectionHStack.addArrangedSubview(self.upsButton!)
        
        
        self.downsButton = UIButton()
        self.downsButton?.titleLabel?.font = font
        self.downsButton?.tintColor = upsDownsColor
        self.downsButton?.setTitle("↓ \(comment.downs ?? 0)", for: .normal)
        self.downsButton!.widthAnchor.constraint(equalToConstant: 75).isActive = true
        self.downsButton!.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.downsButton!.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        self.commentsSectionHStack.addArrangedSubview(self.downsButton!)
        
        
        self.replyButton = UIButton()
        self.replyButton?.titleLabel?.font = font
        self.replyButton?.tintColor = upsDownsColor
        self.replyButton?.setTitle("Reply", for: .normal)
        self.replyButton!.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.replyButton!.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.replyButton!.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        self.commentsSectionHStack.addArrangedSubview(self.replyButton!)
        
        self.moreButton = UIButton()
        self.moreButton?.titleLabel?.font = font
        self.moreButton?.tintColor = upsDownsColor
        self.moreButton?.setTitle("•••", for: .normal)
        self.moreButton!.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.moreButton!.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.moreButton!.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        self.commentsSectionHStack.addArrangedSubview(self.moreButton!)
    }
    @objc func pressed(sender: UIButton!) {
        if sender === upsButton {
          print("Hanle up click button action here")
        } else if sender === downsButton {
          print("Handle down click button action here")
        }else if sender === replyButton {
          print("Hanle reply button action here")
        } else if sender === moreButton {
          print("Handle more button action here")
        }
    }
}
