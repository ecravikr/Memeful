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
        cell.layer.cornerRadius = 5
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
      return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(
       _ collectionView: UICollectionView,
       heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return memeList[indexPath.item].posterSize!.height
     }
}
