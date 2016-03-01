//
//  RoundAvatar.swift
//  CornerRadius
//
//  Created by Limon on 16/3/1.
//  Copyright © 2016年 CornerRadius. All rights reserved.
//

import Foundation
import Kingfisher
import Navi

struct RoundAvatar {

    let avatarURL: NSURL
    var key: String {
        return "navi_\(avatarURL.absoluteString)"
    }
}

let roundAvatarStyle: AvatarStyle = .RoundedRectangle(size: CGSize(width: 30, height: 30), cornerRadius: 15, borderWidth: 0)

extension RoundAvatar: Navi.Avatar {

    var URL: NSURL? {
        return avatarURL
    }
    var style: AvatarStyle {
        return roundAvatarStyle
    }
    var placeholderImage: UIImage? {
        return nil
    }
    var localOriginalImage: UIImage? {
        return nil
    }
    var localStyledImage: UIImage? {
        return nil
    }

    func saveOriginalImage(originalImage: UIImage, styledImage: UIImage) {
        KingfisherManager.sharedManager.cache.storeImage(styledImage, originalData: nil, forKey: key, toDisk: true, completionHandler: nil)
    }
}