//
//  MemeDetailVC.swift
//  Memeful
//
//  Created by Sunmoon on 22/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit


class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    var meme:Meme?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Welcome to MemeDetailViewController")
        self.detailsTableView.delegate = self
        self.detailsTableView.dataSource = self
        self.detailsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let headerView:HeaderView = HeaderView.fromNib()
        headerView.frame = CGRect(x: self.view.frame.origin.x,y: self.view.frame.origin.y,width: self.view.frame.width,height: meme!.posterSize!.height + CGFloat(108))
        headerView.setUpHeaderView(meme: self.meme!)
        self.detailsTableView.tableHeaderView = headerView
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "ABC"
        return cell
    }
    
    
    
}
