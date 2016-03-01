//
//  ViewController.swift
//  CornerRadius
//
//  Created by Limon on 16/3/1.
//  Copyright © 2016年 CornerRadius. All rights reserved.
//

import UIKit
import Kingfisher
import Navi

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    private let avatarURLStrings = [
        "http://tp2.sinaimg.cn/5191033181/180/40099887881/1",
        "http://tp2.sinaimg.cn/1885190365/180/1292238800/1",
        "http://tp4.sinaimg.cn/2463797455/180/5720402811/1",
        "http://cms.csdnimg.cn/article/201407/01/53b21ca1c9e37.jpg"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNib(UINib(nibName: CollectionViewCell.cor_className, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.cor_className)
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatarURLStrings.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCell.cor_className, forIndexPath: indexPath) as! CollectionViewCell
        let URLString = avatarURLStrings[indexPath.row]

        cell.imageView.kf_setImageWithURL(NSURL(string: URLString)!)
        cell.imageView1.kf_setImageWithURL(NSURL(string: URLString)!)
        cell.imageView2.kf_setImageWithURL(NSURL(string: URLString)!)


        // 方案三：使用 Navi 进行圆角处理，模拟器使用 Navi 有 BUG，请使用真机测试
        // 原理：Navi 会根据 AvatarStyle 对图片进行裁剪，裁剪完你可在协议方法 -saveOriginalImage 中保存图片
        // 文章：http://vocaro.com/trevor/blog/2009/10/12/resize-a-uiimage-the-right-way/

        if let image = KingfisherManager.sharedManager.cache.retrieveImageInMemoryCacheForKey("navi_\(URLString)") ?? KingfisherManager.sharedManager.cache.retrieveImageInDiskCacheForKey("navi_\(URLString)") {

            cell.imageView3.image = image

        } else {

            cell.imageView3.navi_setAvatar(RoundAvatar(avatarURL: NSURL(string: URLString)!), withFadeTransitionDuration: 0.25)
        }

        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: ScreenWidth, height: 200)
    }
}


extension UICollectionReusableView {
    static var cor_className: String {
        return "\(self)"
    }
}


let ScreenBounds = UIScreen.mainScreen().bounds
let ScreenWidth = ceil(UIScreen.mainScreen().bounds.size.width)
let ScreenHeight = ceil(UIScreen.mainScreen().bounds.size.height)

