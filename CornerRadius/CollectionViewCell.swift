//
//  CollectionViewCell.swift
//  KingfisherExtension
//
//  Created by catch on 15/11/18.
//  Copyright © 2015年 KingfisherExtension. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()


        // ******* 以下两种方案使用 maskView **********


        // 方案一：使用圆角图片
        imageView.maskView = UIImageView(image: UIImage(named: "appIcon_placeholder"))


        // 方案二：画出想要的 Path
        let maskView = UIView(frame: CGRect(origin: CGPointZero, size: imageView.frame.size))
        let maskColorView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 20), size: imageView.frame.size))
        maskColorView.backgroundColor = UIColor.redColor()
        maskView.backgroundColor = UIColor.clearColor()
        maskView.addSubview(maskColorView)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: maskView.frame, byRoundingCorners: [.TopLeft, .TopRight], cornerRadii: CGSize(width: 14.0, height: 0.0)).CGPath
        maskColorView.layer.mask = shapeLayer

        imageView1.maskView = maskView

    }

}
