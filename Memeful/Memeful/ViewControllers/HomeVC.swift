//
//  HomeVC.swift
//  Memeful
//
//  Created by Sunmoon on 22/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import UIKit

let kMemeCellIdentifier = "memecell"

class HomeViewController: UIViewController {

    @IBOutlet weak var memeCollectionView: UICollectionView!
    var memeList:Array<Meme> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Welcome to Home VC")
        
        //Collectionview settings
        memeCollectionView.delegate = self
        memeCollectionView.dataSource = self
        memeCollectionView.backgroundColor = UIColor.black
        memeCollectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        getMemeList()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func getMemeList(){
        let meme = Meme()
        self.memeList.append(meme)
        self.memeList.append(meme)
        self.memeList.append(meme)
        self.memeList.append(meme)
        self.memeList.append(meme)
        self.memeList.append(meme)
        self.memeList.append(meme)
        memeCollectionView.reloadData()
    }


}

extension HomeViewController:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CustomLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let meme = memeList[indexPath.item]
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: kMemeCellIdentifier, for: indexPath) as! MemeCell
        cell.setupMemeCell(withMeme: meme)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
      return CGSize(width: itemSize, height: itemSize)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.tabBarController?.tabBar.isHidden = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memeDetailVC:MemeDetailViewController = storyboard.instantiateViewController(identifier: "memeDetailVC")
        memeDetailVC.meme = memeList[indexPath.item]
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }
    
    
    
    
    //MARK: CustomLayout delegate
    func collectionView(
       _ collectionView: UICollectionView,
       heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return memeList[indexPath.item].posterSize!.height
     }
}
