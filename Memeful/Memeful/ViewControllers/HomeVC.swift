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
        self.view.backgroundColor = viewBGColor
        
        //Navigation bar
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [navBarGradientColor_1.cgColor,
                               navBarGradientColor_2.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            navigationBar.setBackgroundImage(self.imageFromLayer(layer: gradient), for: .default)
        }
        
        
        //Collectionview settings
        memeCollectionView.delegate = self
        memeCollectionView.dataSource = self
        memeCollectionView.backgroundColor = viewBGColor
        memeCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if let layout = memeCollectionView?.collectionViewLayout as? CustomLayout {
          layout.delegate = self
        }
        
        getMemeList()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    func imageFromLayer(layer:CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func getMemeList(){
        self.view.showProgress()
        APIKit.shared.getGalary { (aDataList) in
            self.memeList = aDataList!.data
            DispatchQueue.main.async {
                self.view.hideProgress()
                self.memeCollectionView.reloadData()
            }            
        }
        
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
        let memeDetailVC:MemeDetailViewController = storyboard.instantiateViewController(identifier: "memeDetailVC") as MemeDetailViewController
        memeDetailVC.meme = memeList[indexPath.item]
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }
    
    
    
    
    //MARK: CustomLayout delegate
    func collectionView(
       _ collectionView: UICollectionView,
       heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let meme = memeList[indexPath.item]
        return CGFloat(meme.images?.first?.height ?? 0)/2
     }
}
