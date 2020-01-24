//
//  MemeDetailVC.swift
//  Memeful
//
//  Created by Sunmoon on 22/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit

let kMemeDetailCell = "MemeDetailCell"

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    var meme:Meme?
    var commentsList:[Comment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Welcome to MemeDetailViewController")
        if let title = meme?.title{
            self.navigationItem.title = title
        }
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        self.detailsTableView.delegate = self
        self.detailsTableView.dataSource = self
        self.detailsTableView.register(UINib(nibName: kMemeDetailCell, bundle: nil), forCellReuseIdentifier: kMemeDetailCell)
        let headerView:HeaderView = HeaderView.fromNib()
        
        if let _ = self.meme?.images?.first?.height{
            headerView.frame = CGRect(x: self.view.frame.origin.x,
                   y: self.view.frame.origin.y,
                   width: self.view.frame.width,
                   height: self.getHeight(meme: meme!))
            headerView.setUpHeaderView(meme: self.meme!)
            self.detailsTableView.tableHeaderView = headerView
        }
        self.detailsTableView.backgroundColor = viewBGColor
        self.view.backgroundColor = viewBGColor
        self.getCommentsList()
        
    }
    func getCommentsList() {
        self.view.showProgress()
        if let galaryId = self.meme?.id{
            APIKit.shared.getCommentsFor(galleryHash: galaryId) { (commentsList) in
                self.commentsList = commentsList!.data
                DispatchQueue.main.async {
                    self.view.hideProgress()
                    self.detailsTableView.reloadData()
                }
            }
        }
        
    }
    func getHeight(meme:Meme)->CGFloat{
        
        if !(meme.images?.first?.animated)!{
            if let memeImageHeight = self.meme?.images?.first?.height, let memeImageWidth = self.meme?.images?.first?.width{
                let aspectRatio = CGFloat(memeImageHeight) / CGFloat(memeImageWidth)
                let tabelViewWidth = self.view.frame.width
                return ((tabelViewWidth/aspectRatio) + 108)
            }
        }
        return 108
    }


}


extension MemeDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MemeDetailCell = tableView.dequeueReusableCell(withIdentifier: kMemeDetailCell, for: indexPath) as! MemeDetailCell
        let comment:Comment = self.commentsList[indexPath.section]
        cell.setupComment(comment: comment, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        footerView.backgroundColor = UIColor.black
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if self.commentsList.count-1 == section{
//            return 0
//        }
        return 5
    }
    
    
    
}
