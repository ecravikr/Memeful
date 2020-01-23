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
        totalReplies.backgroundColor = UIColor.getColor(red: 62, green: 64, blue: 69)
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
        let color = UIColor.getColor(red: 164, green: 174, blue: 192)
        
        let ups = UILabel()
        ups.text = "↑ \(comment.ups ?? 0)"
        ups.font = font
        ups.textColor = color
        ups.textColor = UIColor.white
        ups.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ups.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.commentsSectionHStack.addArrangedSubview(ups)
        
        let dns = UILabel.init()
        dns.text = "↓ \(comment.downs ?? 0)"
        dns.font = font
        dns.textColor = color
        dns.textColor = UIColor.white
        dns.widthAnchor.constraint(equalToConstant: 50).isActive = true
        dns.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.commentsSectionHStack.addArrangedSubview(dns)
        
        
        self.replyButton = UIButton()
        self.replyButton?.titleLabel?.font = font
        self.replyButton?.tintColor = color
        self.replyButton?.setTitle("Reply", for: .normal)
        self.replyButton!.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.replyButton!.heightAnchor.constraint(equalToConstant: 28).isActive = true
        //self.replyButton!.addTarget(self, action: Selector(("buttonClicked:")), for: .touchUpInside)
        self.commentsSectionHStack.addArrangedSubview(self.replyButton!)
        
        self.moreButton = UIButton()
        self.moreButton?.titleLabel?.font = font
        self.moreButton?.tintColor = color
        self.moreButton?.setTitle("•••", for: .normal)
        self.moreButton!.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.moreButton!.heightAnchor.constraint(equalToConstant: 28).isActive = true
        //self.moreButton!.addTarget(self, action: Selector(("buttonClicked:")), for: .touchUpInside)
        self.commentsSectionHStack.addArrangedSubview(self.moreButton!)
        
        
    }
    
    func buttonClicked(_ sender: UIButton) {
      if sender === replyButton {
        print("Hanle reply button action here")
      } else if sender === moreButton {
        print("Handle more button action here")
      }
    }
}
