//
//  FeedPostItemInfo.swift
//  InstagramNoSB
//
//  Created by Григорий Данилюк on 10.01.2023.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
