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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Welcome to MemeDetailViewController")
        self.detailsTableView.delegate = self
        self.detailsTableView.dataSource = self
        self.detailsTableView.register(UINib(nibName: kMemeDetailCell, bundle: nil), forCellReuseIdentifier: kMemeDetailCell)
        //self.detailsTableView.register(MemeDetailCell.self, forCellReuseIdentifier: "kMemeDetailCell")
        let headerView:HeaderView = HeaderView.fromNib()
        
        if let memeImageHeight = self.meme?.images?.first?.height{
            headerView.frame = CGRect(x: self.view.frame.origin.x,y: self.view.frame.origin.y,width: self.view.frame.width,height: CGFloat(memeImageHeight) + CGFloat(108))
            headerView.setUpHeaderView(meme: self.meme!)
            self.detailsTableView.tableHeaderView = headerView
        }
        
    }


}


extension MemeDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MemeDetailCell = tableView.dequeueReusableCell(withIdentifier: kMemeDetailCell, for: indexPath) as! MemeDetailCell
        cell.setupComment(indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        footerView.backgroundColor = UIColor.black
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    
    
}
